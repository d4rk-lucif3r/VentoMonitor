import QtQuick 2.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.3
//import QtQuick.Timeline 1.0
//import QtQuick.VirtualKeyboard 2.3
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0



Item {
    id:entry_view
    width: 800
    height: 480
    property bool isStart: false
    //property bool isReset: true
    property bool ifPatient:false
    property bool startCheck:false
    property string sex: ''
    property var bloodGroup: ''

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



                TextInput {
                    id: name_txtVal
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 12
                    anchors.leftMargin: 0
                    //                        placeholderTextColor: "#fdfdfd"
                    //                        placeholderText: qsTr("Enter Name")
                    font.bold: true
                    color: "#fdfdfd"
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 1
                    wrapMode: "Wrap"
                    maximumLength :30

                    Label {
                        id: nameLabel

                        color: "#fbfbfb"
                        text: qsTr("Name")
                        anchors.fill: parent
                        visible: !name_txtVal.text
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 20
                        styleColor: "#7ffdfdfd"
                        font.bold: true
                    }

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

                TextInput {
                    id: age_txtVal
                    color: "#fdfdfd"
                    Label {
                        id: ageLabel1
                        width: 109
                        color: "#fbfbfb"
                        text: qsTr("Age")
                        anchors.fill: parent
                        visible: !age_txtVal.text
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 0
                        font.pointSize: 20
                        styleColor: "#7ffdfdfd"
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                    }
                    wrapMode: "Wrap"
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    inputMethodHints: Qt.ImhDigitsOnly
                    font.pointSize: 12
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    validator: IntValidator {
                        bottom: 0
                        top: 999
                    }
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
                ComboBox {

                    id: comboBox
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                    displayText: "Blood Group"
                    implicitWidth: 120
                    implicitHeight: 40

                    background: Rectangle {
                        implicitWidth: 120
                        implicitHeight: 40
                        color: "#292c97"
                        radius: 10
                        border.width: 0
                    }


                    anchors.fill: parent
                    model: ["A+", "A-", "B+","B-","AB+","AB-","O+","O-" ]
                    focusPolicy: Qt.NoFocus

                    onActivated:   {
                        comboBox.displayText = currentText

                        entry_view.bloodGroup = currentText
                    }

                    contentItem: Text {

                        text: comboBox.displayText

                        anchors.fill: parent

                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 18
                        font.bold: true

                        color: comboBox.pressed ? "#292c97":"#fbfbfb"
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                    delegate: ItemDelegate {
                        width: comboBox.width
                        //font.family: "Times New Roman"
                        contentItem: Text {
                            text: modelData
                            horizontalAlignment: Text.AlignHCenter
                            font.bold: true
                            font.pointSize: 12
                            color: "#292c97"
                            //font: comboBox.font
                            elide: Text.ElideRight
                            verticalAlignment: Text.AlignVCenter
                        }
                        highlighted: comboBox.highlightedIndex === index
                    }

                    indicator: Canvas {
                        id: canvas
                        x: comboBox.width - width - comboBox.rightPadding
                        y: comboBox.topPadding + (comboBox.availableHeight - height) / 2
                        width: 12
                        height: 8
                        contextType: "2d"


                        onPaint: {
                            context.reset();
                            context.moveTo(0, 0);
                            context.lineTo(width, 0);
                            context.lineTo(width / 2, height);
                            context.closePath();
                            context.fillStyle = comboBox.pressed ? "#ff6937" : "#ff6937";
                            context.fill();
                        }
                    }
                    popup: Popup {
                        y: comboBox.height - 1
                        width: comboBox.width
                        implicitHeight: contentItem.implicitHeight
                        padding: 1

                        contentItem: ListView {
                            clip: true
                            implicitHeight:60
                            model: comboBox.popup.visible ? comboBox.delegateModel : null
                            currentIndex: comboBox.highlightedIndex

                            ScrollIndicator.vertical: ScrollIndicator { }
                        }}
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

                TextInput {
                    id: height_txtVal
                    color: "#fdfdfd"
                    anchors.fill: parent
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

                    Label {
                        id: heightLabel
                        color: "#fbfbfb"
                        text: qsTr("Height")
                        anchors.fill: parent
                        visible: !height_txtVal.text
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 20
                        styleColor: "#7ffdfdfd"
                        horizontalAlignment: Text.AlignHCenter
                        font.bold: true
                    }
                    wrapMode: "Wrap"
                    verticalAlignment: Text.AlignVCenter
                    inputMethodHints: Qt.ImhDigitsOnly
                    font.pointSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    validator: IntValidator {
                        bottom: 0
                        top: 999
                    }
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

                ComboBox {
                    id: comboBox1
                    editable: true
                    anchors.fill: parent
                    contentItem: Text {
                        id: sex_txt
                        color: comboBox1.pressed ? "#292c97":"#fbfbfb"
                        text: comboBox1.displayText
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 18
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                        font.bold: true
                    }
                    implicitWidth: 120
                    model: ["M","F","O" ]
                    implicitHeight: 40
                    background: Rectangle {
                        color: "#292c97"
                        radius: 10
                        implicitWidth: 120
                        implicitHeight: 40
                        border.width: 0
                    }
                    displayText: 'Sex'
                    delegate: ItemDelegate {
                        width: comboBox1.width
                        contentItem: Text {
                            color: "#292c97"
                            text: modelData
                            font.pointSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            elide: Text.ElideRight
                            verticalAlignment: Text.AlignVCenter
                            font.bold: true
                        }
                        highlighted: comboBox1.highlightedIndex === index
                    }

                    popup: Popup {
                        //{keyboard_item.visible= false}
                        y: comboBox1.height - 1
                        width: comboBox1.width
                        contentItem: ListView {
                            clip: true
                            ScrollIndicator.vertical: ScrollIndicator {
                            }
                            model: comboBox1.popup.visible ? comboBox1.delegateModel : null
                            currentIndex: comboBox1.highlightedIndex
                            implicitHeight: 60
                        }
                        implicitHeight: contentItem.implicitHeight
                        padding: 1
                    }
                    indicator: Canvas {
                        id: canvas1
                        x: comboBox1.width - width - comboBox1.rightPadding
                        y: comboBox1.topPadding + (comboBox1.availableHeight - height) / 2
                        width: 12
                        height: 8
                        visible: true
                        contextType: "2d"
                        onPaint: {
                            context.reset();
                            context.moveTo(0, 0);
                            context.lineTo(width, 0);
                            context.lineTo(width / 2, height);
                            context.closePath();
                            context.fillStyle = comboBox1.pressed ? "#ff6937" : "#ff6937";
                            context.fill();
                        }
                    }
                    focusPolicy: Qt.NoFocus
                    onHoveredChanged: {
                        var i = 0
                    print(i)
                    i++
                    }

                    onActivated:   {

                        comboBox1.displayText = currentText

                        entry_view.sex = currentText
                    }

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

                TextInput {
                    id: weight_txtVal
                    color: "#fdfdfd"
                    anchors.fill: parent
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

                    Label {
                        id: weightLabel
                        color: "#fbfbfb"
                        text: qsTr("Weight")
                        anchors.fill: parent
                        visible: !weight_txtVal.text
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 20
                        styleColor: "#7ffdfdfd"
                        horizontalAlignment: Text.AlignHCenter
                        font.bold: true
                    }
                    wrapMode: "Wrap"
                    verticalAlignment: Text.AlignVCenter
                    inputMethodHints: Qt.ImhDigitsOnly
                    font.pointSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    validator: IntValidator {
                        bottom: 0
                        top: 999
                    }
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
                color: "#ff6937"
                radius: 7
                Text {
                    id: startButton_text
                    color: "#ffffff"
                    anchors.fill:parent
                    text: qsTr("Start")
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
                       slot.saveData(entry_view)
                       slot.start()
                        //entry_view.visible=false


                        // if((!patientID_txtVal.text)||(!name_txtVal.text)||
                        //             (!age_txtVal.text)||
                        //             (!bloodGroup_txtVal.text)||
                        //             (!height_txtVal.text)||
                        //             (!weight_txtVal.text))
                        //     {
                        //         emptyDataCall.visible = true
                        //         startButtonMousearea.enabled = false
                        //         emptyCheckTimer.running = true
                        //     }
                        //     else
                        //     {
                        // emptyDataCall.visible = false
                        // startButtonMousearea.enabled = true
                        //data_view.visible=true
                        //stack.push(data_view)
                        load_page('Page 2')
                        // startCheck=true


//                            comboBox1.focus = Qt.NoFocus
//                            comboBox.focus = Qt.NoFocus
                            slot.get_pat_data(name_txtVal, age_txtVal, height_txtVal, weight_txtVal, entry_view)
                            // slot.saveData(entry_view)
                            isStart = true

                            name_txtVal.text = ''
                            age_txtVal.text = ''
                            height_txtVal.text = ''
                            weight_txtVal.text = ''
                            comboBox.displayText = 'Blood Group'
                            comboBox1.displayText = 'Sex'

                            //slot.state_check(entry_view)
                        

                        //}


                    }

                }
            }

        }


        Frame{
            id:keyboard_frame
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
                radius: 7
                visible: false

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
            }

            Rectangle {
                id: emptyDataCall
                x: 0
                y: 252
                width: 169
                height: 67
                color: "#d01e1e"
                radius: 7
                visible: false

                Text {
                    id: emptyDataCallTxt
                    color: "#f2f2f2"
                    anchors.fill:parent
                    text: qsTr("One or More Inputs are Empty Please Check")
                    wrapMode: Text.Wrap
                    font.bold: true
                    font.pixelSize: 15
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Timer{
                id : entry_timer
                interval:10
                running: false
                repeat: true
                onTriggered: {
                    //   print(sl.value)

                    if((patientID_txtVal.text==="")||(name_txtVal.text==="")||
                            (age_txtVal.text=="")||
                            (bloodGroup_txtVal.text==="")||
                            (height_txtVal.text=="")||
                            (weight_txtVal.text==""))
                    {
                        emptyDataCall.visible = true
                        startButtonMousearea.enabled = false
                    }
                    else
                    {
                        emptyDataCall.visible = false
                        startButtonMousearea.enabled = true

                    }

                }

            }

        }





//       Item {
//            id: keyboard_item
//           anchors.topMargin: 259
//           anchors.fill: parent

//            InputPanel {
//                id: keyboard
//              anchors.rightMargin: 195
//              anchors.fill: parent
//              parent: keyboard_item
//              visible: Qt.inputMethod.visible
//                Binding {
//                    target: keyboard.keyboard.style
//                    property: 'keyboardDesignHeight'
//                    value: 850
//                }
//          }}
    }
//    Data{
//        id:data_view
//        width: 800
//        height: 459
//        visible: false
//    }

}








































































