import QtQuick 2.3
import QtQuick.Controls 2.3
//import QtQuick.Timeline 1.0
import QtQuick.Layouts 1.3
import QtCharts 2.1
import QtQuick.Window 2.2





Rectangle {
    id: root

    width: 800
    height: 480
    property bool timer1 : true
    property bool timer2 : true
    property bool timer3 : true

    property int tv: 600

    property int rr: 12
    property int fio2: 10
    property bool isReset: false
    property var ie_list: ['1:1','1:1.5','1:2','1:4','1:5']
    property var peep_list: [00, 01, 02, 03, 04,05, 06, 07, 08, 09, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    property int peep_i: 0
    property int select: 0
    property int ie_i: 0
    //property bool isStart: false
    property var predict : 0
    //property alias updatesEnabled: timeText.updatesEnabled
    //  property int count:0
    property int max:0
    property int min:0

    // property int pr_max:0
    // property int pr_min:0

    // property int pip_max:0
    // property int pip_min:0

    // property int peep_max:0
    // property int peep_min:0

    // property int sys_max:0
    // property int sys_min:0

    // property int spo2_max:0
    // property int spo2_min:0

    property string tv_color: '#42cfbc'
    property string rr_color: '#42cfbc'
    property string fio2_color: '#42cfbc'


    Item{
        id: data_view
        Image {
            id: main_bg
            x: 0
            y: 0
            width: 800
            height: 479
            //  visible: false
            source: "../assets/images/main-bg.png"
            fillMode: Image.PreserveAspectFit

            Image {
                id: bp
                x: 612
                y: 346
                width: 180
                height: 130
                source: "../assets/images/BP.png"
                fillMode: Image.PreserveAspectFit
                Text {
                    id: sys_val
                    x: 16
                    y: 73
                    width: 47
                    height: 31
                    color: "#42cfbc"
                    text: qsTr("0")
                    font.pixelSize: 23
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.family: "Arial"


                }

                Text {
                    id: dia_val
                    x: 115
                    y: 73
                    width: 47
                    height: 31
                    color: "#42cfbc"
                    text: qsTr("0")
                    font.pixelSize: 23
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.family: "Arial"

                }

            }
            Text {
                id: tv
                x: 687
                y: 99
                width: 30
                height: 20
                color: "#3c3e95"
                text: qsTr("VT")
                font.pixelSize: 20
                font.bold: true
                font.family: "Arial"
                font.italic: false
            }

            Image {
                id: tv_minus
                x: 612
                y: 117
                width: 51
                height: 62
                source: "../assets/images/btn-remove-normal.png"
                fillMode: Image.PreserveAspectFit

                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        slot.valChange(root,'minus','TV',connectTimer)

                    }
                }

            }

            Rectangle {
                id: rectangle2
                x: 670
                y: 202
                width: 64
                height: 36

                Text {
                    id: rr_val
                    anchors.fill:parent
                    color: root.rr_color
                    text: root.rr.toString()
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.family: "Arial"
                    MouseArea{
                        anchors.fill:parent
                        onClicked: {
                            root.select = 2
                            slot.encoder(root)
                        }

                    }
                }

            }



            Image {
                id: tv_plus
                x: 740
                y: 117
                width: 51
                height: 62
                source: "../assets/images/btn-add-normal.png"
                fillMode: Image.PreserveAspectFit


                MouseArea{
                    anchors.fill: parent



                    onClicked:{
                        slot.valChange(root,'plus','TV',connectTimer)
                    }


                }

            }

            Rectangle {
                id: ppeak_rect
                x: 8
                y: 328
                width: 84
                height: 80
                color: "#3c3e95"
                radius: 4

                Text {
                    id: ppeak_txt
                    color: "#ffffff"
                    text: qsTr("Ppeak")
                    anchors.leftMargin: 2
                    anchors.fill: parent
                    font.pixelSize: 14

                    verticalAlignment: Text.AlignTop
                    lineHeight: 0.9
                    font.bold: true
                }

                Text {
                    id: ppeak_val
                    color: "#ffffff"
                    text: qsTr("12")
                    anchors.fill: parent
                    font.pixelSize: 40
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Arial"
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                }

                Text {
                    id: peep_unit_txt1
                    color: "#ffffff"
                    text: qsTr("cmH2O")
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 3
                    anchors.leftMargin: 2
                    anchors.topMargin: 66
                    anchors.fill: parent
                    font.pixelSize: 12

                    verticalAlignment: Text.AlignBottom
                    horizontalAlignment: Text.AlignRight
                    font.bold: false

                }
            }

            Rectangle {
                id: ie_rect
                x: 98
                y: 328
                width: 84
                height: 80
                color: "#3c3e95"
                radius: 4
                Text {
                    id: ie_txt
                    color: "#ffffff"
                    text: qsTr("I:E")
                    anchors.fill: parent
                    font.pixelSize: 14
                    verticalAlignment: Text.AlignTop
                    lineHeight: 0.9
                    font.bold: true
                }

                Text {
                    id: ie_val
                    color: "#ffffff"
                    text: qsTr("1:2")
                    anchors.fill: parent
                    font.pixelSize: 40
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Arial"
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true

                    MouseArea {
                        anchors.fill: parent
                    }
                }
            }
        }

        Image {
            id: rr_minus
            x: 612
            y: 194
            width: 51
            height: 62
            source: "../assets/images/btn-remove-normal.png"
            fillMode: Image.PreserveAspectFit

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    slot.valChange(root,'minus','RR',connectTimer)
                }
            }


            Image {
                id: fio2_minus
                x: 0
                y: 73
                width: 51
                height: 62
                fillMode: Image.PreserveAspectFit
                source: "../assets/images/btn-remove-normal.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        slot.valChange(root,'minus','FiO2',connectTimer)
                    }

                }
            }


        }

        Image {
            id: rr_plus
            x: 740
            y: 194
            width: 51
            height: 62
            source: "../assets/images/btn-add-normal.png"
            fillMode: Image.PreserveAspectFit

            MouseArea{
                anchors.fill: parent


                onClicked:{
                    slot.valChange(root,'plus','RR',connectTimer)
                }

            }
        }

        Text {
            id: rr
            x: 687
            y: 172
            color: "#3c3e95"
            text: qsTr("RR")
            font.pixelSize: 20
            font.bold: true
            font.family: "Arial"


        }

        Image {
            id: pr
            x: 8
            y: 6
            width: 172
            height: 81
            source: "../assets/images/button3.jpg"
            fillMode: Image.PreserveAspectFit

            Text {
                id: pr_val
                color: "#ffffff"
                text: qsTr("60")
                anchors.leftMargin: 55
                anchors.bottomMargin: 8
                anchors.fill: parent
                font.pixelSize: 60
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignBottom
                font.family: "Arial"
                font.bold: true
            }

            Text {
                id: pr_txt
                color: "#ffffff"
                text: qsTr("PR")
                anchors.fill: parent
                font.pixelSize: 16
                lineHeight: 0.9
                anchors.bottomMargin: 51
                verticalAlignment: Text.AlignTop
                font.bold: true
                anchors.topMargin: 5
                anchors.leftMargin: 3
                anchors.rightMargin: 117
            }

            Text {
                id: pr_unit_txt
                x: -6
                y: -6
                color: "#ffffff"
                text: qsTr("/min")
                anchors.fill: parent
                font.pixelSize: 12
                horizontalAlignment: Text.AlignRight
                anchors.bottomMargin: 12
                verticalAlignment: Text.AlignBottom
                font.bold: false
                anchors.topMargin: 64
                anchors.leftMargin: 125
                anchors.rightMargin: 8
            }
        }
        Image {
            id: spo2
            x: 8
            y: 87
            width: 172
            height: 81
            source: "../assets/images/button3.jpg"
            fillMode: Image.PreserveAspectFit

            Text {
                id: spo2_val
                color: "#ffffff"
                text: qsTr("60")
                anchors.leftMargin: 53
                anchors.bottomMargin: 8
                anchors.fill: parent
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 60
                font.family: "Arial"
                verticalAlignment: Text.AlignBottom
                font.bold: true
            }

            Text {
                id: spo2_txt
                color: "#ffffff"
                text: qsTr("SpO<sub>2</sub> ")
                textFormat: Text.RichText
                anchors.fill: parent
                font.pixelSize: 16
                anchors.bottomMargin: 51
                lineHeight: 0.9
                verticalAlignment: Text.AlignTop
                font.bold: true
                anchors.topMargin: 5
                anchors.leftMargin: 3
                anchors.rightMargin: 117
            }

            Text {
                id: spo2_unit_txt
                x: -6
                y: -6
                color: "#ffffff"
                text: qsTr("%")
                anchors.fill: parent
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 12
                anchors.bottomMargin: 12
                verticalAlignment: Text.AlignBottom
                font.bold: false
                anchors.topMargin: 64
                anchors.leftMargin: 122
                anchors.rightMargin: 10
            }
        }
        Image {
            id: pip
            x: 8
            y: 168
            width: 172
            height: 81
            source: "../assets/images/button3.jpg"
            fillMode: Image.PreserveAspectFit

            Text {
                id: pip_val
                color: "#ffffff"
                text: qsTr("60")
                anchors.leftMargin: 54
                anchors.bottomMargin: 12
                anchors.fill: parent
                font.pixelSize: 60
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignBottom
                font.family: "Arial"
                font.bold: true
            }

            Text {
                id: pip_txt
                color: "#ffffff"
                text: qsTr("PIP")
                anchors.fill: parent
                font.pixelSize: 16
                lineHeight: 0.9
                anchors.bottomMargin: 51
                verticalAlignment: Text.AlignTop
                font.bold: true
                anchors.topMargin: 5
                anchors.leftMargin: 3
                anchors.rightMargin: 117
            }

            Text {
                id: pip_unit_txt
                x: 7
                y: 2
                color: "#ffffff"
                text: qsTr("cmH2O")
                anchors.fill: parent
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 12
                anchors.bottomMargin: 12
                verticalAlignment: Text.AlignBottom
                font.bold: false
                anchors.topMargin: 64
                anchors.leftMargin: 125
                anchors.rightMargin: 8
            }
        }
        Image {
            id: peep
            x: 8
            y: 248
            width: 172
            height: 80
            source: "../assets/images/button3.jpg"
            fillMode: Image.PreserveAspectFit

            Text {
                id: peep_val
                color: "#ffffff"
                text: "60"
                anchors.leftMargin: 51
                anchors.bottomMargin: 12
                anchors.fill: parent
                font.pixelSize: 60
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignBottom
                font.family: "Arial"
                font.bold: true

            }

            Text {
                id: peep_txt
                color: "#ffffff"
                text: qsTr("PEEP")
                font.bold: true
                anchors.rightMargin: 117
                anchors.fill: parent
                font.pixelSize: 16
                anchors.bottomMargin: 51
                lineHeight: 0.9
                verticalAlignment: Text.AlignTop
                anchors.topMargin: 5
                anchors.leftMargin: 3
            }
            Text {
                id: peep_unit_txt
                color: "#ffffff"
                text: qsTr("cmH2O")
                font.bold: false
                anchors.rightMargin: 8
                anchors.leftMargin: 125
                anchors.topMargin: 64
                anchors.bottomMargin: 12
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignBottom
                anchors.fill: parent
                font.pixelSize: 12
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    if(root.peep_i<=peep_list.length)
                    {
                        peep_val.text = peep_list[peep_i]
                        root.peep_i+=1;
                        if(root.peep_i==peep_list.length){
                            root.peep_i=0;
                        }
                    }

                }
                }

        }

        Image {
            id: mode
            x: 160
            y: 407
            width: 144
            height: 59
            source: "../assets/images/button.jpg"
            fillMode: Image.PreserveAspectFit

            Image {
                id: image3
                x: 108
                y: 4
                width: 28
                height: 45
                source: "../assets/images/3Dots.png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: alarms_txt1
                color: "#ffffff"
                text: qsTr("Mode")
                anchors.leftMargin: 12
                anchors.topMargin: 4
                anchors.bottomMargin: 10
                anchors.fill: parent
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 15
                font.family: "Arial"
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                anchors.rightMargin: 49
            }
        }

        Image {
            id: patient_info
            x: 309
            y: 407
            width: 144
            height: 59
            source: "../assets/images/button.jpg"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                height: 59
                anchors.topMargin: 2
                anchors.fill: parent
                onClicked: {
                    //                        starting_page.ifPatient = true
                    //                        root.visible = false
                    //                        if(starting_page.ifPatient)
                    //                        {
                    //                            starting_page.startButton_text.text = "Back"
                    //                            starting_page.startButton.color="#42cfbc"
                    //                            starting_page.patientInfoShow.visible = true
                    //                        }
                    load_page('Page 4')

                }

                Image {
                    id: image4
                    x: 108
                    y: 1
                    width: 30
                    height: 45
                    source: "../assets/images/info.png"
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: alarms_txt2
                    color: "#ffffff"
                    text: qsTr("Patient Info")
                    anchors.leftMargin: 0
                    anchors.topMargin: 4
                    anchors.fill: parent
                    font.pixelSize: 15
                    horizontalAlignment: Text.AlignRight
                    anchors.bottomMargin: 11
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Arial"
                    font.bold: true
                    anchors.rightMargin: 44
                }
            }
        }

        Image {
            id: reset
            x: 459
            y: 407
            width: 144
            height: 59
            source: "../assets/images/button.jpg"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                height: 59
                anchors.fill: parent
                onClicked: {
                    //                        root.visible = false
                    timer1 = false
                    timer2 = false
                    timer3 = false
                    load_page('Page 1')
                    slot.reset()
                    
                    root.isReset = true
                    //root.isStart = true

                    slot.state_check(root)
                    slot.exit()
                    // name_txtVal.text=""
                    // age_txtVal.text=""
                    // height_txtVal.text=""
                    // weight_txtVal.text = ""
                    // startButton_text.text = "Start"
                    // startButton.color = "#ff6937"
                    // patientInfoShow.visible = false


                    // starting_page.isStart = false
                    // starting_page.ifPatient = false

                    // comboBox.displayText= "Blood Group"
                    // comboBox1.displayText = "Sex"

                    // entry_timer.running = false



                }

                Text {
                    id: alarms_txt3
                    color: "#ffffff"
                    text: qsTr("Reset")
                    anchors.topMargin: 6
                    anchors.leftMargin: 8
                    anchors.fill: parent
                    font.pixelSize: 15
                    horizontalAlignment: Text.AlignRight
                    anchors.bottomMargin: 11
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Arial"
                    font.bold: true
                    anchors.rightMargin: 77
                }

                Image {
                    id: image5
                    x: 98
                    y: 6
                    width: 28
                    height: 42
                    source: "../assets/images/reset_icon.png"
                    fillMode: Image.PreserveAspectFit
                }

            }
        }


        Image {
            id: power
            x: 646
            y: 2
            width: 67
            height: 27
            source: "../assets/images/Power-state.png"
            fillMode: Image.PreserveAspectFit
        }




        Rectangle {
            id: rectangle
            x: 670
            y: 125
            width: 64
            height: 34

            Text {
                id: tv_val
                anchors.fill: parent
                color: root.tv_color
                text: root.tv.toString()
                font.pixelSize: 30
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.family: "Arial"

                MouseArea{
                    anchors.fill:parent
                    onClicked: {
                        root.select = 1
                        slot.encoder(root)
                    }

                }

            }

        }




    Rectangle {
        id: canvas
        x: 186
        y: 0
        width: 420
        height: 111
        color: "#ecf2fe"
        clip: true

        ChartView{
            anchors.fill : parent
            id: ecg_chart
            title: ""
            titleColor: "#000000"
            plotAreaColor: "#ecf2fe"
            backgroundColor: "#ecf2fe"
            dropShadowEnabled: true
            backgroundRoundness: 7
            legend.visible: false
            margins.bottom: 0
            margins.top: 0
            margins.left: 0
            margins.right: 0
            animationOptions :ChartView.SeriesAnimations
            LineSeries{
                id: ecg_lineSeries
                width: 0
                color: "#3337a0"
                pointLabelsClipping: false
                pointLabelsVisible: false
                pointsVisible: false
                pointLabelsColor: "#2e2e95"

                //name: ""
                // visible: true

                useOpenGL: true

                axisX: ValueAxis {
                    id: axisX

                    tickCount: 2
                    minorGridVisible: false
                    titleVisible: false
                    titleText: ""
                    color: "#ff724b"

                    lineVisible: true
                    gridVisible:false
                    labelsVisible: false
                    shadesVisible: false
                    min: 0
                    max: 50
                }
                axisY: ValueAxis {
                    id: axisY
                    tickCount: 2
                    minorGridVisible: false
                    color: "#ff724b"

                    titleVisible: false
                    lineVisible: true
                    shadesVisible: false
                    gridVisible:false
                    labelsVisible: false
                    min: -5
                    max: 15
                }


            
             
           
           
           
           } Image {
                id: image
                x: 428
                y: 4
                width: 24
                height: 21
                source: "../assets/images/location.png"
                fillMode: Image.PreserveAspectFit
            }

        }

}

        ChartView{
            id:spo2_chartview
            width: 420
            height: 111
            title: ""
            smooth: false
            backgroundColor: "#ecf2fe"
            dropShadowEnabled: true
            backgroundRoundness: 7
            x: 186
            y: 98
            legend.visible: false
            margins.bottom: 0
            margins.top: 0
            margins.left: 0
            margins.right: 0
            // plotArea: Qt.rect(0, 0, 420, 111)
            LineSeries{
                id: ecg2_lineSeries
                width: 0
                color: "#3337a0"
                pointLabelsClipping: false
                pointLabelsVisible: false
                pointsVisible: false
                pointLabelsColor: "#2e2e95"
                // useOpenGL: true
                axisX: ValueAxis {
                    id: axisX1
                    tickCount: 2
                    minorGridVisible: false
                    titleVisible: false
                    titleText: ""
                    color: "#ff724b"

                    lineVisible: true
                    gridVisible:false
                    labelsVisible: false
                    shadesVisible: false
                    min: 0
                    max: 50
                    
                }
                axisY: ValueAxis {
                    id: axisY1
                    tickCount: 2
                    minorGridVisible: false
                    color: "#ff724b"

                    titleVisible: false
                    lineVisible: true
                    shadesVisible: false
                    gridVisible:false
                    labelsVisible: false
                    min: -5
                    max: 15
                }
            }

        }

        ChartView{
            id:pr_chartview
            x: 186
            y: 199
            width: 420
            height: 111
            title: qsTr("")
            titleColor: "#2e2e95"
            backgroundColor: "#ecf2fe"
            dropShadowEnabled: true
            backgroundRoundness: 7
            legend.visible: false
            margins.bottom: 0
            margins.top: 0
            margins.left: 0
            margins.right: 0
            SplineSeries{
                id: pr_lineSeries
                width: 0
                color: "#3337a0"
                pointLabelsClipping: false
                pointLabelsVisible: false
                pointsVisible: false
                pointLabelsColor: "#2e2e95"

                //useOpenGL: true
                axisX: ValueAxis {
                    id: axisX2
                    // reverse: true
                    tickCount: 2
                    minorGridVisible: false
                    titleVisible: false
                    titleText: ""
                    color: "#ff724b"

                    lineVisible: true
                    gridVisible:false
                    labelsVisible: false
                    shadesVisible: false
                    min: 0
                    max: 60
                }
                axisY: ValueAxis {
                    id: axisY2
                    tickCount: 2
                    minorGridVisible: false
                    color: "#ff724b"
                    // reverse: true
                    titleVisible: false
                    lineVisible: true
                    shadesVisible: false
                    gridVisible:false
                    labelsVisible: false
                    // min: 0
                    // max: 2
                }
            }

        }


        ChartView{
            id:foo_chartview
            x: 186
            y: 298
            width: 420
            height: 111
            backgroundColor: "#ecf2fe"
            dropShadowEnabled: true
            backgroundRoundness: 7
            legend.visible: false
            animationOptions :ChartView.SeriesAnimations

            margins.bottom: 0

            margins.top: 0
            margins.left: 0
            margins.right: 0

            SplineSeries{
                id: foo_lineSeries
                color: "#3337a0"
                pointLabelsClipping: false
                pointLabelsVisible: false
                pointsVisible: false
                pointLabelsColor: "#2e2e95"
                width: 1
                capStyle:Qt.RoundCap


                useOpenGL: true
                axisX: ValueAxis {
                    id: axisX3
                    tickCount: 2
                    minorGridVisible: false
                    titleVisible: false
                    titleText: ""
                    color: "#ff724b"

                    lineVisible: true
                    gridVisible:false
                    labelsVisible: false
                    shadesVisible: false
                    min: 0
                    max: 50

                }
                axisY: ValueAxis {
                    id: axisY3
                    tickCount: 2
                    minorGridVisible: false
                    color: "#ff724b"

                    titleVisible: false
                    lineVisible: true
                    shadesVisible: false
                    gridVisible:false
                    labelsVisible: false
                    min: 0
                    max: 12



                }

            }

        }
        Timer{
            id:connectTimer
            interval:100
            running: timer1
            repeat: true
            onTriggered:{
                
                // slot.connectRecieve()
            }
        }
        Timer
        {
            id: sendTimer
            interval : 200
            running : timer2
            repeat : true
            onTriggered:{
                slot.send_sensor_data(connectTimer)
            }
        }
        Timer {
            id : timer
            interval:100
            running: timer3
            repeat: true

            onTriggered:  {
                // if (entry_view.isStart){
                    // slot.connectRecieve()
                    

                // slot.checkAlarm()
                // /* Slots are defined in slots.py*/
                // slot.update_ecg(ecg_lineSeries)
                // slot.update_ecg2(ecg2_lineSeries)
                slot.update_spo2(pr_lineSeries, axisY2)
                // slot.update_foo(foo_lineSeries)
                slot.fetch_set_alarms(root, true, false)
                slot.update_text(pr_val, spo2_val, pip_val, peep_val, sys_val, dia_val, root)




                // }

            }
        }

        Rectangle {
            id: alarms
            x: 10
            y: 411
            width: 144
            height: 47
            color: "#f72d2d"
            radius: 10

            Text {
                id: alarms_txt
                color: "#ffffff"
                text: qsTr("Alarms")
                anchors.rightMargin: 69
                font.bold: true
                font.family: "Arial"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                anchors.fill: parent
                font.pixelSize: 15
            }
            MouseArea{
                anchors.fill: parent
                onClicked:
                {
                    // data_view.destroy
                    //                        settings_view.visible = true
                    //                        data_view.visibleChildren = false
                    timer1 = false
                    timer2 = false
                    timer3 = false
                    ecg_lineSeries.clear()
                    ecg2_lineSeries.clear()
                    pr_lineSeries.clear()
                    foo_lineSeries.clear()
                    load_page('Page 3', {'timer4':true})
                    



                }

                Image {
                    id: image2
                    x: 104
                    y: 0
                    width: 30
                    height: 47
                    source: "../assets/images/settings_icon.png"
                    fillMode: Image.PreserveAspectFit
                }



            }
        }

        Image {
            id: fio2_plus
            x: 740
            y: 266
            width: 51
            height: 62
            fillMode: Image.PreserveAspectFit
            source: "../assets/images/btn-add-normal.png"
            MouseArea{
                anchors.fill: parent


                onClicked: {
                    slot.valChange(root,'plus','FiO2',connectTimer)
                }

            }

        }

        Text {
            id: fio2_txt
            x: 681
            y: 244
            color: "#3c3e95"
            textFormat: Text.RichText
            text: "FiO<sub>2</sub> "
            font.family: "Arial"
            font.bold: true
            font.pixelSize: 20
        }

        Text {
            id: fio2_val
            x: 670
            y: 268
            width: 64
            height: 43
            color: root.fio2_color
            text: root.fio2.toString()
            font.family: "Arial"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pixelSize: 30
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    root.select = 3
                    slot.encoder(root)
                }

            }
        }}

        Text {
            id: timeText
            x: 720
            y: 0
            width: 64
            height: 28
            color: "#3c3e95"
            text: {
                updatesEnabled: timeText.time
                Qt.formatTime(new Date(),"hh:mm")
            }
            font.bold: true
            font.pixelSize: 14
        }
        Timer {
            id: timer_time
            interval: 10 // i set to 10 for testing for faster results, but worked on 100 also
            running: true
            repeat: true
            onTriggered: timeText.text = new Date().toLocaleTimeString(Qt.locale(), "hh:mm AP")
        }

        Rectangle {
            id: settings
            x: 613
            y: 41
            width: 179
            height: 43
            color: "#5bcebd"
            radius: 10

            Image {
                id: settings_image
                x: 126
                y: 8
                width: 48
                height: 27
                source: "../assets/images/settings_icon2.png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: settings_txt
                color: "#ffffff"
                text: qsTr("Settings")
                anchors.rightMargin: 84
                font.pixelSize: 15
                horizontalAlignment: Text.AlignRight
                anchors.fill: parent
                font.family: "Arial"
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    dialog.open()
                }
            }
        }


    Dialog {
        id:dialog
        height: 200

        parent: root
        background: Rectangle{
            color: "#000000"
            radius: 10

        }
        //anchors.centerIn: parent
        contentItem: Rectangle{
            id: settingsRectangle
            color: "#000000"
            radius: 10
            anchors.centerIn: parent
            implicitHeight: 180
            implicitWidth: 400
            Column{
                //                    anchors.rightMargin: 5
                //                    anchors.leftMargin: 5
                //                    anchors.bottomMargin: 5
                //                    anchors.topMargin: 5
                anchors.fill: parent
                spacing: 4
                Rectangle{
                    id : powerRectangle
                    width: parent.width
                    height: 59
                    color: "#000000"
                    Row{
                        anchors.fill: parent
                        spacing: 4
                        Rectangle { color: "#3c3e95"; radius: 10; width: parent.width / 2 - parent.spacing; height: parent.height;Text {
                                id: shutdownTxt
                                color: "#ffffff"
                                text: qsTr("Power Off")
                                font.bold: true
                                font.pointSize: 20
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.fill: parent

                            }
                            MouseArea{
                                anchors.fill: parent
                                onClicked:{slot.shutdown(shutdownTxt);
                                }
                            }
                        }
                        Rectangle { color: "#3c3e95"; radius: 10; width: parent.width / 2 - parent.spacing; height: parent.height;Text {
                                id: rebootTxt
                                color: "#ffffff"
                                text: qsTr("Restart")
                                font.bold: true
                                font.pointSize: 20
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                anchors.fill: parent
                            }
                            MouseArea{
                                anchors.fill: parent
                                onClicked:{slot.reboot(rebootTxt);}
                            }}
                    }
                }
                Rectangle { color: "#3c3e95"; radius: 10; width: parent.width; height: parent.height / 3 - parent.spacing;Text {
                        id: connectionStatusTxt
                        color: "#f72d2d"
                        text: qsTr("Not Connected")
                        font.bold: true
                        font.pointSize: 20
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        anchors.fill: parent
                    } }
                Rectangle { color: "#f72d2d"; radius: 10; width: parent.width; height: parent.height / 3 - parent.spacing; Text {
                        id: closeSettingsTxt
                        color: "#ffffff"
                        text: qsTr("Close")
                        font.bold: true
                        font.pointSize: 20
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        anchors.fill: parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{dialog.close()}
                    }}


            }  }
    }

}
//    Settings_page{
//        id:settings_view
//        visible: false
//    }


// Entry{
//id:entry_view
//visible:false
//}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.8999999761581421}
}
##^##*/





















































































































































































































/*##^## Designer {
    D{i:15;anchors_x:3}D{i:16;anchors_height:41}D{i:17;anchors_x:0;anchors_y:-4}D{i:20;anchors_x:"-2";anchors_y:"-9"}
}
 ##^##*/
