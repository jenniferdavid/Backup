/* Cargo-ANTs software prototype.
 *
 * Copyright (C) 2014 Roland Philippsen. All rights reserved.
 *
 * BSD license:
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the copyright holder nor the names of
 *    contributors to this software may be used to endorse or promote
 *    products derived from this software without specific prior written
 *    permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHORS AND CONTRIBUTORS ``AS IS''
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 * PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR THE CONTRIBUTORS TO THIS SOFTWARE BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 * GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "cargo_ants_rol/rolMessage.hpp"
#include "cargo_ants_rol/rolClient.hpp"
#include "cargo_ants_rol/rolServer.hpp"
#include <err.h>
#include <iostream>
#include <stdlib.h>
#include <fstream>
#include <string>
#include <vector>
#include <stdio.h>
#include <errno.h>
#include <unistd.h>


using namespace std;
using namespace cargo_ants_rol;


int main (int argc, char ** argv)
{
  if (argc < 3) {
    errx (EXIT_FAILURE, "specify [c host port] or [s port]");
  }
  
  if ('c' == argv[1][0]) {
    rolClient client;
    cout << "creating client for host " << argv[2] << " port " << argv[3] << "\n";
    if (0 != client.init (argv[2], argv[3], cerr)) {
      exit (EXIT_FAILURE);
    }
    rolMessage msg (42, 0, 0);
    for (size_t ii (0); true; ii = (ii + 1) % 4) {
      for (size_t jj (0); jj < 4; ++jj) {
	msg.resize (ii, jj);
	for (msg_int_t kk (0); kk < msg.nInts(); ++kk) {
	  msg.ints()[kk] = 100 + kk;
	}
	for (msg_int_t kk (0); kk < msg.nReals(); ++kk) {
	  msg.reals()[kk] = 10.0 + kk;
	}
	if (msg.buflen() == client.write (msg.buf(), msg.buflen())) {
	  cout << "wrote " << ii << " " << jj << "\n";
	  msg.dump (cout);
	  usleep (500000);
	}
	else {
	  cout << "failed to write " << ii << " " << jj << "\n";
	  usleep (1000000);
	}
      }
    }
  }
  
  else if ('s' == argv[1][0]) {
    rolServer server;
    cout << "creating server on port " << argv[2] << "\n";
    if (0 != server.start (argv[2], cerr)) {
      exit (EXIT_FAILURE);
    }
    for (;;) {
      rolMessage msg (42, 0, 0);
      if (msg.buflen() != server.peek (msg.buf(), msg.buflen())) {
	cout << "failed to peek\n";
	usleep (1000000);
	continue;
      }
      msg.resize (msg.nInts(), msg.nReals());
      if (msg.buflen() != server.receive (msg.buf(), msg.buflen())) {
	cout << "failed to receive (that's weird: we were able to peek!)\n";
	usleep (1000000);
	continue;
      }
      cout << "received\n";
      msg.dump (cout);
    }
  }
  
  else {
    errx (EXIT_FAILURE, "expected c or s, not %c", argv[1][0]);
  }
}
