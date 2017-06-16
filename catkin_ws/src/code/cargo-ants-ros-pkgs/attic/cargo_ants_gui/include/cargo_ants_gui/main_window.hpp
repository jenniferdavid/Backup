/**
 * @file /include/cargo_ants_gui/main_window.hpp
 *
 * @brief Qt based gui for cargo_ants_gui.
 *
 * @date November 2010
 **/
#ifndef cargo_ants_gui_MAIN_WINDOW_H
#define cargo_ants_gui_MAIN_WINDOW_H

/*****************************************************************************
** Includes
*****************************************************************************/

#include <QtGui/QMainWindow>
#include "ui_main_window.h"
#include "qnode.hpp"

/*****************************************************************************
** Namespace
*****************************************************************************/

namespace cargo_ants_gui {

/*****************************************************************************
** Interface [MainWindow]
*****************************************************************************/
/**
 * @brief Qt central, all operations relating to the view part here.
 */
class MainWindow : public QMainWindow {
Q_OBJECT

public:
	MainWindow(int argc, char** argv, QWidget *parent = 0);
	~MainWindow();

	void showNoMasterMessage();
	void showNoContainerMessage();
	void showNoSchedulingMessage();

public Q_SLOTS:


    /******************************************
    ** Manual connections
    *******************************************/
  //    void updateLoggingView(); // no idea why this can't connect automatically
    void containertoschedule();
    void listing();
    void listing2();
    void listing3();

    void on_TaskSchedule_clicked(bool check );
private:
	Ui::MainWindowDesign ui;
	QNode qnode;
};
}  // namespace cargo_ants_gui

#endif // cargo_ants_gui_MAIN_WINDOW_H
