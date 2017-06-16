#include <sys/types.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <memory.h>
#include <ifaddrs.h>
#include <net/if.h>
#include <errno.h>
#include <stdlib.h>
#include <iostream>
#include <stdlib.h>
#include <iostream>
#include "ros/ros.h"
#include "cargo_ants_msgs/ReferenceTrajectory.h"
#include <stdlib.h>
#include <fstream>
#include <string>
#include <vector>
#include <stdio.h>
#include <errno.h>
#include <err.h>
#include <unistd.h>
#include <sstream>

static const char* ADDRESS_TARGET ="10.10.172.101";
static int REMOTE_PORT = 1342;
static bool USE_HASHING = false;

using namespace cargo_ants_msgs;
using namespace std;

int resolvehelper(const char* hostname, int family, const char* service, sockaddr_storage* pAddr)
{
    int result;
    addrinfo* result_list = NULL;
    addrinfo hints = {};
    hints.ai_family = family;
    hints.ai_socktype = SOCK_DGRAM; // without this flag, getaddrinfo will return 3x the number of addresses (one for each socket type).
    result = getaddrinfo(hostname, service, &hints, &result_list);
    if (result == 0)
    {
        //ASSERT(result_list->ai_addrlen <= sizeof(sockaddr_in));
        memcpy(pAddr, result_list->ai_addr, result_list->ai_addrlen);
        freeaddrinfo(result_list);
    }
    if(family == AF_INET) {
		int target = REMOTE_PORT;
		sockaddr_in* pAddrIn = (struct sockaddr_in*)pAddr;
        pAddrIn->sin_port = htons(REMOTE_PORT);
    }else{
		assert(false);//precaution
	}

    return result;
}

static void encodeToBuffer_ByRow(double* array,bool write_hash, ReferenceTrajectory::ConstPtr const & rosmsg){
	const int nFields = 11;
    int MSG_HASH = 108;
    int offset_hash;
    int N = rosmsg->points.size();
	
	if(write_hash){
		assert(sizeof(double) == sizeof(int)*2);
		int* arrayAsInt = (int*) array;
		arrayAsInt[0] = MSG_HASH;
		arrayAsInt[1] = 0;
		offset_hash = 1;
	}else{
		offset_hash = 0;
	}

    for (int row = 0; row < rosmsg->points.size(); row++){
		array[row * nFields + 0 + offset_hash] = rosmsg->ID;
		array[row * nFields + 1 + offset_hash] = rosmsg->dt;
		array[row * nFields + 2 + offset_hash] = rosmsg->points[row].xx;
        array[row * nFields + 3 + offset_hash] = rosmsg->points[row].yy;
		array[row * nFields + 4 + offset_hash] = rosmsg->points[row].th;
		array[row * nFields + 5 + offset_hash] = rosmsg->points[row].xd;
		array[row * nFields + 6 + offset_hash] = rosmsg->points[row].yd;
		array[row * nFields + 7 + offset_hash] = rosmsg->points[row].thd;
		array[row * nFields + 8 + offset_hash] = rosmsg->points[row].xdd;
		array[row * nFields + 9 + offset_hash] = rosmsg->points[row].ydd;
		array[row * nFields + 10 + offset_hash] = rosmsg->points[row].thdd;
    }
}

static void encodeToBuffer_ByColumn(double* array,bool write_hash, ReferenceTrajectory::ConstPtr const & rosmsg){
	const int nFields = 11;
    int MSG_HASH = 108;
    int offset_hash;
    int N = rosmsg->points.size();
	
	if(write_hash){
		assert(sizeof(double) == sizeof(int)*2);
		int* arrayAsInt = (int*) array;
		arrayAsInt[0] = MSG_HASH;
		arrayAsInt[1] = 0;
		offset_hash = 1;
	}else{
		offset_hash = 0;
	}

    for (int row = 0; row < rosmsg->points.size(); row++){
		array[N*0 + row + offset_hash] = rosmsg->ID;
		array[N*1 + row + offset_hash] = rosmsg->dt;
		array[N*2 + row + offset_hash] = rosmsg->points[row].xx;
        array[N*3 + row + offset_hash] = rosmsg->points[row].yy;
		array[N*4 + row + offset_hash] = rosmsg->points[row].th;
		array[N*5 + row + offset_hash] = rosmsg->points[row].xd;
		array[N*6 + row + offset_hash] = rosmsg->points[row].yd;
		array[N*7 + row + offset_hash] = rosmsg->points[row].thd;
		array[N*8 + row + offset_hash] = rosmsg->points[row].xdd;
		array[N*9 + row + offset_hash] = rosmsg->points[row].ydd;
		array[N*10 + row + offset_hash] = rosmsg->points[row].thdd;
    }
}

static int so_broadcast = 1;
static int sock;
static sockaddr_in addrListen =  {};
static sockaddr_storage addrDest = {};

void initSenderSocket(){
	int result = 0;
    sock = socket(AF_INET, SOCK_DGRAM, 0);
    if( sock == -1 ){
	    std::cout << "error: socket" << sock << std::endl;
    }
    //allow broadcasts
    result = setsockopt( sock, SOL_SOCKET, SO_BROADCAST, &so_broadcast, sizeof(so_broadcast) );
    if( result == -1 ){
	    std::cout << "error: broadcast" << result << std::endl;
    }

    char szIP[100];
    //addrListen = {}; // zero-int, sin_port is 0, which picks a random port for bind.
    addrListen.sin_family = AF_INET;
    result = bind(sock, (sockaddr*)&addrListen, sizeof(addrListen));
    if (result == -1)
    {
       int lasterror = errno;
       std::cout << "error on bind: " << lasterror << std::endl;
       exit(1);
    }
    //addrDest = {};
    result = resolvehelper(ADDRESS_TARGET, AF_INET, "30000", &addrDest );
    if (result != 0)
    {
       int lasterror = errno;
       std::cout << "error on resolving: " << lasterror << std::endl;
       exit(1);
    }
}

static void reftrj_cb (ReferenceTrajectory::ConstPtr const & rosmsg){   
    double N2 = 200;

	/* Sending */
    double N = rosmsg->points.size();
	bool use_hash = USE_HASHING;
    const int NF = 11;//Number of fields
    int nItemsActual = N*NF;
    int nItemsExpected = N2*NF;
    int offset_hash = use_hash? 1:0;
	//offset_hash = ceil(sizeof(double)/sizeof(int))
    
    //clear
    double array[nItemsExpected+offset_hash];
    for(int i=0;i<(nItemsExpected+offset_hash);i++){
		array[i] = 0;
	}

	encodeToBuffer_ByRow(array,use_hash, rosmsg);
    int result = sendto(sock, array, sizeof(array), 0, (sockaddr*)&addrDest, sizeof(addrDest));

	/* Debugging */
    std::cout << result << " bytes of doubles sent. It is trajectory info of "<< N <<" points" << std::endl;
    //ROS_INFO("PING");
    
}

int main(int argc, char **argv)
{
	if(argc >= 2)
		ADDRESS_TARGET = argv[1];
	if(argc >= 3){
		istringstream ss(argv[2]);
		if (!(ss >> REMOTE_PORT)){
			cerr << "Invalid number " << argv[2] << '\n';
			exit(1);
		}
	}
		
	cout<<"Using Target = "<<ADDRESS_TARGET<<" , remote port = "<<REMOTE_PORT<<" Hashing? "<<USE_HASHING<<"\n";
	
	initSenderSocket();
	
    ros::init (argc, argv, "subscriber");
    ros::NodeHandle node;
    ros::Subscriber blah (node.subscribe ("trajectory", 1000, reftrj_cb));
  
    cout << "subscribed to udp, calling ros::spin\n";
    
    ros::spin();
 /*   while (ros::ok()) {
    ros::spinOnce();
    cout << "." << flush;
    usleep (2000000);
    }
   */    
    close(sock);
   
    return 0;
}
