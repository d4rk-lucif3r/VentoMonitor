import QtQuick 2.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.3
//import QtQuick.Timeline 1.0
Item {
    id:alarms_root
   // visible: true
    width: 800
    height: 480
    visible: true
    property bool timer4: false

    property int max: 0
    property int min: 0

    property int pr_max: 100
    property int pr_min: 60
    property int pr_max_prev: 0
    property int pr_min_prev: 0

    property int spo2_max: 101
    property int spo2_min: 93
    property int spo2_max_prev: 0
    property int spo2_min_prev: 0

    property int pip_max: 30
    property int pip_min: 20
    property int pip_max_prev: 0
    property int pip_min_prev: 0

    property int peep_max: 6
    property int peep_min: 4
    property int peep_max_prev: 0
    property int peep_min_prev: 0

    property int sys_max: 180
    property int sys_min: 120
    property int sys_max_prev: 0
    property int sys_min_prev: 0

    property int dia_max: 150
    property int dia_min: 80
    property int dia_max_prev: 0
    property int dia_min_prev: 0

    property string param: ''
    property string alarm_name_text : ''


    Image {
        anchors.fill: parent
        id: settings_bg

        source: "../assets/images/main-bg.png"

        Rectangle {
            id: limit_container
            x: 8
            y: 19
            width: 194
            height: 443
            color: "#5bcebd"
            radius: 15

            Rectangle {
                id: pr_alarm
                x: 8
                y: 14
                width: 178
                height: 54
                color: "#ff724b"
                radius: 15
                Text {
                    id: pr_alarm_txt
                    color: "#ffffff"
                    text: qsTr("PR")
                    font.bold: true
                    font.pointSize: 28
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
                MouseArea{
                    visible: true
                    anchors.fill: parent
                    onClicked: {
                        min_max_container.visible = true
                        limits_and_alarms_show.visible = false
                        back_limits_alarms.visible = false
                        alarm_name_text = 'PR'
                        param = 'PR'
                        alarms_root.pr_max_prev = alarms_root.pr_max
                        alarms_root.pr_min_prev = alarms_root.pr_min
                }

                }
            }

            Rectangle {
                id: spo2_alarm
                x: 8
                y: 74
                width: 178
                height: 54
                color: "#3c3e95"
                radius: 15

                Text {
                    id: spo2_alarm_txt
                    color: "#ffffff"
                    textFormat: Text.RichText
                    text: "SpO<sub>2</sub> "
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 28
                    font.bold: true
                    anchors.fill: parent
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        min_max_container.visible = true
                        limits_and_alarms_show.visible = false
                        back_limits_alarms.visible = false
                        alarm_name_text = 'SpO<sub>2</sub>'
                        param = 'SPO2'
                        alarms_root.spo2_max_prev = alarms_root.spo2_max
                        alarms_root.spo2_min_prev = alarms_root.spo2_min
                }}
            }

            Rectangle {
                id: pip_alarm
                x: 8
                y: 134
                width: 178
                height: 54
                color: "#ff724b"
                radius: 15

                Text {
                    id: pip_alarm_txt
                    color: "#ffffff"
                    text: qsTr("PIP")
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 28
                    font.bold: true
                    anchors.fill: parent
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        min_max_container.visible = true
                        limits_and_alarms_show.visible = false
                        back_limits_alarms.visible = false
                        alarm_name_text = 'PIP'
                        alarms_root.pip_max_prev = alarms_root.pip_max
                        alarms_root.pip_min_prev = alarms_root.pip_min


                }}
            }

            Rectangle {
                id: peep_alarm
                x: 8
                y: 195
                width: 178
                height: 54
                color: "#3c3e95"
                radius: 15

                Text {
                    id: peep_alarm_txt
                    color: "#ffffff"
                    text: qsTr("PEEP")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 28
                    anchors.fill: parent
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        min_max_container.visible = true
                        limits_and_alarms_show.visible = false
                        back_limits_alarms.visible = false
                        alarm_name_text = 'PEEP'
                        alarms_root.peep_max_prev = alarms_root.peep_max
                        alarms_root.peep_min_prev = alarms_root.peep_min

                }}
            }

            Rectangle {
                id: dia_alarm
                x: 8
                y: 272
                width: 178
                height: 139
                color: "#3c3e95"
                radius: 15

                Text {
                    id: dia_alarm_txt
                    color: "#ffffff"
                    text: qsTr("DIA")
                    font.pixelSize: 20
                    anchors.topMargin: 63
                    anchors.rightMargin: 97
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    anchors.fill: parent
                }
                MouseArea{
                    anchors.topMargin: 63
                    anchors.rightMargin: 97
                    anchors.fill: parent

                    onClicked: {
                        min_max_container.visible = true
                        limits_and_alarms_show.visible = false
                        back_limits_alarms.visible = false
                        alarm_name_text = 'DIA'
                        alarms_root.dia_max_prev = alarms_root.dia_max
                        alarms_root.dia_min_prev = alarms_root.dia_min

                    }}

                Text {
                    id: sys_alarm_txt
                    color: "#ffffff"
                    text: qsTr("SYS")
                    anchors.topMargin: 63
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.leftMargin: 99
                    anchors.fill: parent
                    font.pixelSize: 20

                    MouseArea {
                        anchors.topMargin: 0
                        anchors.fill: parent
                        onClicked: {
                            min_max_container.visible = true
                            limits_and_alarms_show.visible = false
                            back_limits_alarms.visible = false
                            alarm_name_text = 'SYS'
                            alarms_root.sys_max_prev = alarms_root.sys_max
                            alarms_root.sys_min_prev = alarms_root.sys_min

                        }
                    }
                }

                Text {
                    id: element1
                    color: "#ffffff"
                    text: qsTr("BP")
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.bottomMargin: 76
                    anchors.fill: parent
                    font.pixelSize: 32
                }
            }
        }

        Rectangle {
            id: min_max_container
            x: 208
            y: 19
            width: 477
            height: 443
            color: "#e5e5e1"
            radius: 15
            visible: false

            Rectangle {
                id: current_alarm_frame
                x: 14
                y: 8
                width: 455
                height: 144
                color: "#5bcebd"
                radius: 15

                Text {
                    id: alarm_name
                    text: alarm_name_text.toString()
                    visible: true
                    textFormat: Text.RichText
                    font.family: "Arial"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                    font.pixelSize: 35
                }
            }

            Item {
                id: element
                x: 101
                y: 189
                width: 368
                height: 75

                Image {
                    id: max_alarm_1
                    x: 99
                    y: 0
                    width: 70
                    height: 75
                    fillMode: Image.PreserveAspectFit
                    source: "../assets/images/btn-add-normal.png"
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{



                            if(alarms_root.alarm_name_text == 'PR') {
                                if(alarms_root.pr_max<200 && alarms_root.pr_max>=0)
                                {
                                    alarms_root.pr_max+=1
                                 }
                            }
                            if(alarms_root.alarm_name_text == 'SpO<sub>2</sub>') {
                                if(alarms_root.spo2_max<200 && alarms_root.spo2_max>=0)
                                {
                                    alarms_root.spo2_max+=1
                                 }
                            }
                            if(alarms_root.alarm_name_text == 'PIP') {
                                if(alarms_root.pip_max<200 && alarms_root.pip_max>=0)
                                {
                                    alarms_root.pip_max+=1
                                 }
                            }
                            if(alarms_root.alarm_name_text == 'PEEP') {
                                if(alarms_root.peep_max<200 && alarms_root.peep_max>=0)
                                {
                                    alarms_root.peep_max+=1
                                 }
                            }
                            if(alarms_root.alarm_name_text == 'SYS') {
                                if(alarms_root.sys_max<200 && alarms_root.sys_max>=0)
                                {
                                    alarms_root.sys_max+=1
                                 }
                               }
                           if(alarms_root.alarm_name_text == 'DIA') {
                                if(alarms_root.dia_max<200 && alarms_root.dia_max>=0)
                                {
                                    alarms_root.dia_max+=1
                                 }
                               }

                            }


                    }

                }

                Image {
                    id: min_alarm_1
                    x: 277
                    y: 0
                    width: 70
                    height: 75
                    fillMode: Image.PreserveAspectFit
                    source: "../assets/images/btn-remove-normal.png"
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{

                            if(alarms_root.alarm_name_text == 'PR') {
                                if(alarms_root.pr_max<200 && alarms_root.pr_max>0)
                                {
                                    alarms_root.pr_max-=1
                                 }
                            }
                            if(alarms_root.alarm_name_text == 'SpO<sub>2</sub>') {
                                if(alarms_root.spo2_max<200 && alarms_root.spo2_max>0)
                                {
                                    alarms_root.spo2_max-=1
                                 }
                            }
                            if(alarms_root.alarm_name_text == 'PIP') {
                                if(alarms_root.pip_max<200 && alarms_root.pip_max>0)
                                {
                                    alarms_root.pip_max-=1
                                 }
                            }
                            if(alarms_root.alarm_name_text == 'PEEP') {
                                if(alarms_root.peep_max<200 && alarms_root.peep_max>0)
                                {
                                    alarms_root.peep_max-=1
                                 }
                            }
                            if(alarms_root.alarm_name_text == 'SYS') {
                                if(alarms_root.sys_max<200 && alarms_root.sys_max>0)
                                {
                                    alarms_root.sys_max-=1
                                 }
                               }
                           if(alarms_root.alarm_name_text == 'DIA') {
                                if(alarms_root.dia_max<200 && alarms_root.dia_max>0)
                                {
                                    alarms_root.dia_max-=1
                                 }
                               }

                            }
                    }
                }

                Rectangle {
                    id: max_val_rect
                    x: 175
                    y: 0
                    width: 96
                    height: 67
                    color: "#e0e1e4"

                    Text {
                        id: max_val
                        text: {
                            if(alarms_root.alarm_name_text == 'PR'  ) {
                                 alarms_root.pr_max.toString()
                            }
                            else if(alarms_root.alarm_name_text == 'SpO<sub>2</sub>' ) {
                                alarms_root.spo2_max.toString()
                            }
                            else if(alarms_root.alarm_name_text == 'PIP' ) {
                               alarms_root.pip_max.toString()
                            }
                            else if(alarms_root.alarm_name_text == 'PEEP') {
                                alarms_root.peep_max.toString()
                            }
                            else if(alarms_root.alarm_name_text == 'SYS' ) {
                                alarms_root.sys_max.toString()
                               }
                           else if(alarms_root.alarm_name_text == 'DIA' ) {
                                alarms_root.dia_max.toString()
                               }
                            else if(alarms_root.pr_max == alarms_root.pr_max_prev){

                            }
                           else {qsTr('0')}

                        }
                        visible: true
                        anchors.bottomMargin: 10
                        font.pixelSize: 36
                        font.family: "Times New Roman"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        anchors.fill: parent
                    }
                }
            }

            Text {
                id: max_alarm_txt
                x: 24
                y: 189
                width: 64
                height: 75
                text: qsTr("MAX")
                font.bold: true
                wrapMode: Text.WordWrap
                font.family: "Arial"
                verticalAlignment: Text.AlignVCenter
                lineHeight: 0.8
                font.pixelSize: 25
            }

            Item {
                id: element2
                x: 101
                y: 292
                width: 368
                height: 75
                Image {
                    id: max_alarm_2
                    x: 99
                    y: 0
                    width: 70
                    height: 75
                    fillMode: Image.PreserveAspectFit
                    source: "../assets/images/btn-add-normal.png"
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{


                            if(alarms_root.alarm_name_text == 'PR') {
                                if(alarms_root.pr_min<200 && alarms_root.pr_min>=0)
                                {
                                    alarms_root.pr_min+=1
                                 }
                            }
                            if(alarms_root.alarm_name_text == 'SpO<sub>2</sub>') {
                                if(alarms_root.spo2_min<200 && alarms_root.spo2_min>=0)
                                {
                                    alarms_root.spo2_min+=1
                                 }
                            }
                            if(alarms_root.alarm_name_text == 'PIP') {
                                if(alarms_root.pip_min<200 && alarms_root.pip_min>=0)
                                {
                                    alarms_root.pip_min+=1
                                 }
                            }
                            if(alarms_root.alarm_name_text == 'PEEP') {
                                if(alarms_root.peep_min<200 && alarms_root.peep_min>=0)
                                {
                                    alarms_root.peep_min+=1
                                 }
                            }
                            if(alarms_root.alarm_name_text == 'SYS') {
                                if(alarms_root.sys_min<200 && alarms_root.sys_min>=0)
                                {
                                    alarms_root.sys_min+=1
                                 }
                               }
                           if(alarms_root.alarm_name_text == 'DIA') {
                                if(alarms_root.dia_min<200 && alarms_root.dia_min>=0)
                                {
                                    alarms_root.dia_min+=1
                                 }
                               }

                            }



                    }
                }

                Image {
                    id: min_alarm_2
                    x: 277
                    y: 0
                    width: 70
                    height: 75
                    fillMode: Image.PreserveAspectFit
                    source: "../assets/images/btn-remove-normal.png"
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{


                            if(alarms_root.alarm_name_text == 'PR') {
                                if(alarms_root.pr_min<200 && alarms_root.pr_min>0)
                                {
                                    alarms_root.pr_min-=1
                                 }
                            }
                            if(alarms_root.alarm_name_text == 'SpO<sub>2</sub>') {
                                if(alarms_root.spo2_min<200 && alarms_root.spo2_min>0)
                                {
                                    alarms_root.spo2_min-=1
                                 }
                            }
                            if(alarms_root.alarm_name_text == 'PIP') {
                                if(alarms_root.pip_min<200 && alarms_root.pip_min>0)
                                {
                                    alarms_root.pip_min-=1
                                 }
                            }
                            if(alarms_root.alarm_name_text == 'PEEP') {
                                if(alarms_root.peep_min<200 && alarms_root.peep_min>0)
                                {
                                    alarms_root.peep_min-=1
                                 }
                            }
                            if(alarms_root.alarm_name_text == 'SYS') {
                                if(alarms_root.sys_min<200 && alarms_root.sys_min>0)
                                {
                                    alarms_root.sys_min-=1
                                 }
                               }
                           if(alarms_root.alarm_name_text == 'DIA') {
                                if(alarms_root.dia_max<200 && alarms_root.dia_max>0)
                                {
                                    alarms_root.dia_min-=1
                                 }
                               }

                            }
                    }
                }

                Rectangle {
                    id: min_val_rect
                    x: 175
                    y: 0
                    width: 96
                    height: 75
                    color: "#e0e1e4"

                    Text {
                        id: min_val
                        text: {
                            if(alarms_root.alarm_name_text == 'PR') {
                                 alarms_root.pr_min.toString()
                            }
                            else if(alarms_root.alarm_name_text == 'SpO<sub>2</sub>') {
                                alarms_root.spo2_min.toString()
                            }
                            else if(alarms_root.alarm_name_text == 'PIP') {
                               alarms_root.pip_min.toString()
                            }
                            else if(alarms_root.alarm_name_text == 'PEEP') {
                                alarms_root.peep_min.toString()
                            }
                            else if(alarms_root.alarm_name_text == 'SYS') {
                                alarms_root.sys_min.toString()
                               }
                           else if(alarms_root.alarm_name_text == 'DIA') {
                                alarms_root.dia_min.toString()
                               }
                           else {qsTr('0')}

                        }
                        anchors.bottomMargin: 10
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Times New Roman"
                        font.pixelSize: 36
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }

            Text {
                id: min_alarm_txt
                x: 24
                y: 286
                width: 64
                height: 75
                text: qsTr("MIN")
                font.family: "Arial"
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                lineHeight: 0.8
                font.pixelSize: 25
            }

            Item
            {
                id: save_discard_alarm
                x: 22
                y: 370

                width: 446
                height: 63


                Rectangle {
                    id: discard_alarm
                    x: 223
                    y: 0
                    anchors.left: save_discard_alarm.left
                    width: save_discard_alarm.width /2 - 5
                    height: save_discard_alarm.height
                    color: "#ec2b13"
                    radius: 15

                    Text {
                        id: discard_txt
                        color: "#ffffff"
                        text: qsTr("Discard")
                        font.bold: true
                        lineHeight: 0.9
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        anchors.fill: parent
                        font.pixelSize: 25
                    }
                    MouseArea{
                    anchors.fill:parent
                    onClicked: {
                        min_max_container.visible = false
                        //min_max_container.visibleChildren = false
                        back_limits_alarms.visible = true
                        limits_and_alarms_show.visible = true
                        limits_and_alarms_txt.visible = true
                        back_limits_alarms_txt.visible = true

                        alarms_root.pr_min = alarms_root.pr_min_prev
                        alarms_root.spo2_min = alarms_root.spo2_min_prev
                        alarms_root.pip_min = alarms_root.pip_min_prev
                        alarms_root.peep_min = alarms_root.peep_min_prev
                        alarms_root.sys_min = alarms_root.sys_min_prev
                        alarms_root.dia_min = alarms_root.dia_min_prev

                        alarms_root.pr_max = alarms_root.pr_max_prev
                        alarms_root.spo2_max = alarms_root.spo2_max_prev
                        alarms_root.pip_max = alarms_root.pip_max_prev
                        alarms_root.peep_max = alarms_root.peep_max_prev
                        alarms_root.sys_max = alarms_root.sys_max_prev
                        alarms_root.dia_max = alarms_root.dia_max_prev


//                        if(alarms_root.alarm_name_text == 'PR'  ) {
//                             max_val.text = alarms_root.pr_max_prev.toString()
//                        }
//                        else if(alarms_root.alarm_name_text == 'SpO<sub>2</sub>' ) {
//                            max_val.text = alarms_root.spo2_max_prev.toString()
//                        }
//                        else if(alarms_root.alarm_name_text == 'PIP' ) {
//                           max_val.text = alarms_root.pip_max_prev.toString()
//                        }
//                        else if(alarms_root.alarm_name_text == 'PEEP') {
//                            max_val.text = alarms_root.peep_max_prev.toString()
//                        }
//                        else if(alarms_root.alarm_name_text == 'SYS' ) {
//                            max_val.text = alarms_root.sys_max_prev.toString()
//                           }
//                       else if(alarms_root.alarm_name_text == 'DIA' ) {
//                            max_val.text = alarms_root.dia_max_prev.toString()
//                           }


                    }

                    }

                }

                Rectangle {
                    id: save_alarm
                    x: -14
                    y: 0
                    anchors.right: save_discard_alarm.right
                    width: save_discard_alarm.width /2 - 5
                    height: save_discard_alarm.height
                    color: "#02a10c"
                    radius: 15

                Text {
                    id: save_txt
                    color: "#ffffff"
                    text: qsTr("Save")
                    anchors.fill: parent
                    font.pixelSize: 25
                    lineHeight: 0.9
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                }
                MouseArea{
                anchors.fill:parent
                onClicked: {
                    min_max_container.visible = false
                    //min_max_container.visibleChildren = false
                    back_limits_alarms.visible = true
                    limits_and_alarms_show.visible = true
                    limits_and_alarms_txt.visible = true
                    back_limits_alarms_txt.visible = true
                    slot.send_alarm(alarms_root, None)
                }

                }

            }}
        }

        Rectangle {
            id: back_limits_alarms
            x: 616
            y: 340
            width: 176
            height: 122
            color: "#f73a3a"
            radius: 15
            visible: true

            Text {
                id: back_limits_alarms_txt
                color: "#ffffff"
                text: qsTr("Back")
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
                font.pixelSize: 30
            }
            MouseArea{
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
            anchors.fill:parent
            onClicked: {
//                alarms_root.visible = false
//                alarms_root.visibleChildren = false
//                data_view.visible=true
                timer4 = false
                load_page('Page 2', {'timer1': true, 'timer2': true, 'timer3': true, })

            }

            }
        }

        Rectangle {
            id: limits_and_alarms_show
            x: 616
            y: 19
            width: 176
            height: 310
            color: "#5bcebd"
            radius: 15
            visible: true

            Text {
                id: limits_and_alarms_txt
                color: "#ffffff"
                text: qsTr("Limits   &  Alarms")
                visible: true
                font.bold: true
                wrapMode: Text.WordWrap
                fontSizeMode: Text.Fit
                textFormat: Text.RichText
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
                font.pixelSize: 26
            }
        }
    Timer{
        id: alarms_timer
        running: timer4
        repeat:false
        interval:100
        onTriggered:{
            slot.fetch_set_alarms(alarms_root, false, false)
        }

    // Timer{
    //     id: alarms_timer_2
    //     running: true
    //     repeat: true
    //     interval:100
    //     onTriggered:{
            
    //     }
    // }
    }

    }

/*Data{
    id:data_view
visible: false
}*/

}


























































