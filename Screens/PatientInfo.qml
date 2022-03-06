import QtQuick 2.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.3

import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0



Item {
    id:patient_view
    width: 800
    height: 480

    property string pname: 'Name'
    property int page: 0
    property string psex: 'Sex'
    property string pbloodGroup: 'NA'
    property int pheight: 0
    property int pweight: 0


    Image{
        id: entry_bg
        fillMode: Image.PreserveAspectFit
        anchors.fill:parent
        source:"../assets/images/main-bg.png"

        Frame{
            id:entry_frame
            x: 0
            y: 0
            width: 607
            height: 459

            Rectangle {
                id: rectangle1
                x: 8
                y: 11
                width: 568
                height: 52
                color: "#292c97"
                radius: 10





                    Text {
                        id: patient_name
                        height: 55
                        color: "#fbfbfb"
                        text: pname

                        font.pointSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        anchors.fill: parent
                        styleColor: "#80fdfdfd"
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                    }


            }

            Rectangle {
                id: rectangle2
                x: 8
                y: 69
                width: 282
                height: 52
                color: "#292c97"
                radius: 10


                    Text {
                        id: patient_age
                        width: 109
                        color: "#fbfbfb"
                        text: page.toString()
                        anchors.fill: parent

                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 0
                        font.pointSize: 20
                        styleColor: "#7ffdfdfd"
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter

                    wrapMode: "Wrap"

                }


            }

            Rectangle {
                id: rectangle3
                x: 8
                y: 128
                width: 568
                height: 52
                color: "#292c97"
                radius: 7

                Text {
                    id: patient_blood
                    color: "#fbfbfb"
                    text: pbloodGroup

                    font.pointSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                    styleColor: "#7ffdfdfd"
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }

            }

            Rectangle {
                id: rectangle4
                x: 8
                y: 187
                width: 282
                height: 52
                color: "#292c97"
                radius: 10


                    Text {
                        id: cmSuffix
                        color: "#ff6937"
                        text: qsTr("cm")
                        font.pixelSize: 18
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 0
                        horizontalAlignment: Text.AlignHCenter
                        font.bold: true
                        anchors.leftMargin: 225
                    }

                    Text {
                        id: patient_height
                        color: "#fbfbfb"
                        text: pheight
                        wrapMode: Text.WordWrap
                        anchors.fill: parent

                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 20
                        styleColor: "#7ffdfdfd"
                        horizontalAlignment: Text.AlignHCenter
                        font.bold: true


                }


            }

            Rectangle {
                id: sex_rect
                x: 293
                y: 69
                width: 282
                height: 52
                color: "#292c97"
                radius: 10

                Text {
                    id: patient_sex
                    color: "#fbfbfb"
                    text: psex
                    font.pointSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                    styleColor: "#7ffdfdfd"
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }




            }

            Rectangle {
                id: rectangle6
                x: 293
                y: 186
                width: 282
                height: 52
                color: "#292c97"
                radius: 10


                    Text {
                        id: kgSuffix
                        width: 56
                        color: "#ff6937"
                        text: qsTr("Kg")
                        font.pixelSize: 18
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 0
                        horizontalAlignment: Text.AlignHCenter
                        font.bold: true
                        anchors.leftMargin: 218
                    }

                    Text {
                        id: patient_weight
                        color: "#fbfbfb"
                        text:pweight
                        anchors.fill: parent

                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 20
                        styleColor: "#7ffdfdfd"
                        horizontalAlignment: Text.AlignHCenter
                        font.bold: true
                    wrapMode: "Wrap"

                }
            }







        }
        Frame{
            id:start_frame

            x: 607;y: 344;width: 193;height: 115

            Rectangle {
                id: startButton
                x: 0
                y: 0
                width: 169
                height: 91
                color: "#3ed0ba"
                radius: 7
                Text {
                    id: startButton_text
                    color: "#ffffff"
                    anchors.fill:parent
                    text: qsTr("Back")
                    font.pixelSize: 35
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Verdana"
                    font.bold: true
                }

                MouseArea{
                    id:startButtonMousearea
                    anchors.fill: parent
                    enabled: true
                    onClicked: {
                    
                        load_page('Page 2')
                        pname = 'Name'
                        page = 0
                        psex ='Sex'
                        pbloodGroup = 'Blood Group'
                        pheight = 0
                        pweight = 0
                    }

                }
            }

        }


        Frame{
            id:sideframe
            x: 607
            y: 0
            width: 193
            height: 343




            Rectangle {
                id: patientInfoShow
                x: 0
                y: 0
                width: 169
                height: 319
                color: "#3ed0ba"
                radius: 10
                visible: true

                Text {
                    id: patientInfoShowTxt
                    color: "#ffffff"
                    anchors.fill: parent
                    text: qsTr("Patient Info")
                    font.pixelSize: 25
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.bottomMargin: 0
                    font.bold: true


                }
            }}}
    Timer{
        id : entry_timer
        interval:10
        running: true
        repeat: true
        onTriggered: {

            //slot.patient_info(patient_name,patient_age,patient_sex,patient_blood,patient_height,patient_weight)
            slot.patient_info(patient_view)

        }
    }


}














































































