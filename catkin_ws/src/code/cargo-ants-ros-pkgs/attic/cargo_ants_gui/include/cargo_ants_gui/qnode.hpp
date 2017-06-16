/**
 * @file /include/cargo_ants_gui/qnode.hpp
 *
 * @brief Communications central!
 *
 * @date February 2011
 **/
/*****************************************************************************
** Ifdefs
*****************************************************************************/

#ifndef cargo_ants_gui_QNODE_HPP_
#define cargo_ants_gui_QNODE_HPP_

/*****************************************************************************
** Includes
*****************************************************************************/

#include <ros/ros.h>
#include <string>
#include <QThread>
#include <QStringListModel>
#include <QListWidgetItem>
#include <iostream>

/*****************************************************************************
** Namespaces
*****************************************************************************/

namespace cargo_ants_gui {

/*****************************************************************************
** Class
*****************************************************************************/

class QNode : public QThread {
    Q_OBJECT
public:
	QNode(int argc, char** argv );
	virtual ~QNode();
	bool init();
	bool init(const std::string &master_url, const std::string &host_url);
  //	void run();

	/*********************
	** Logging
	**********************/
	enum LogLevel {
	         Debug,
	         Info,
	         Warn,
	         Error,
	         Fatal
	 };

	QStringListModel* loggingModel() { return &logging_model; }
	void log( const LogLevel &level, const std::string &msg);
        QListWidgetItem item;
        void run (QList<QListWidgetItem *> const &items);

Q_SIGNALS:
  	void loggingUpdated();
        void rosShutdown();

private:
	int init_argc;
	char** init_argv;
  std::string container_schedule_topic;
	ros::Publisher container_to_schedule;
        QStringListModel logging_model;
};

}  // namespace cargo_ants_gui

#endif /* cargo_ants_gui_QNODE_HPP_ */
