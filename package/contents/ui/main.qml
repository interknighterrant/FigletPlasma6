import QtQuick 2.0
import QtQuick.Layouts 1.0
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasma5support as Plasma5Support
import org.kde.plasma.plasmoid
import org.kde.kirigami as Kirigami
import org.kde.kirigami.private as KirigamiPrivate                  

PlasmoidItem {
  id: root

  preferredRepresentation: compactRepresentation
  fullRepresentation: Item {
    id: fullRepItem

    Layout.preferredWidth: 300
    Layout.preferredHeight: 180

    Plasma5Support.DataSource {
      id: figlet
      engine: "executable"
      connectedSources: []

      onNewData: function(source, data) {
        var all_lines = data.stdout.split(/\r?\n|\r/);
        all_lines.pop(); // Remove empty line at end of string
        var final_output = startLinesWith.text + all_lines.join("\n" + startLinesWith.text);

        KirigamiPrivate.CopyHelperPrivate.copyTextToClipboard( final_output );

        console.log( final_output );

        disconnectSource(source);
      }
      
      function convert() {
        var limitWidthFlag = "-t";
        if ( limitWidth.checked ) { limitWidthFlag = ''; }

        var command = "figlet " + limitWidthFlag + " -f " + font.currentValue + " " + textToConvert.text;

        console.log( command );

        connectSource( command );
      }
    }

    ColumnLayout{
      RowLayout{
        Layout.topMargin: 10
        Layout.bottomMargin: 3
        Layout.fillWidth: true

        PlasmaComponents.Label {
          Layout.leftMargin: 10
          Layout.preferredWidth: 80
          text: "Text: "
        }
        PlasmaComponents.TextField {
          id: textToConvert
          Layout.rightMargin: 10
          Layout.fillWidth: true
          placeholderText: qsTr("Enter Text to Create ASCII Art Text")
        }
      }
      
      PlasmaComponents.CheckBox {
        Layout.leftMargin: 10
        Layout.rightMargin: 10
        Layout.bottomMargin: 3

        id: limitWidth
        checked: true
        text: qsTr("Limit Width")
      }

      RowLayout {
        Layout.bottomMargin: 3
        Layout.fillWidth: true

        PlasmaComponents.Label {
          text: "Font: "

          Layout.leftMargin: 10
          Layout.preferredWidth: 80
        }
        PlasmaComponents.ComboBox {
          id: font
          Layout.rightMargin: 10
          Layout.fillWidth: true
          textRole: "text"
          valueRole: "value"
          model: [
              { value: "small", text: i18n("small") },
              { value: "big", text: i18n("big") },
              { value: "calvin", text: i18n("Calvin S") },
              { value: "smslant", text: i18n("Small Slant") },
              { value: "slant", text: i18n("Slant") },
          ]
        }
      }
      
      RowLayout {
        Layout.bottomMargin: 3
        Layout.fillWidth: true

        PlasmaComponents.Label {
          text: "Line Prefix Characters: "
          Layout.leftMargin: 10
          Layout.preferredWidth: 180
        }
        PlasmaComponents.TextField {
          id: startLinesWith
          Layout.rightMargin: 10
          Layout.fillWidth: true
          placeholderText: qsTr("Character(s)")
        }
      }

      PlasmaComponents.Button {
        Layout.leftMargin: 10
        Layout.rightMargin: 10
        Layout.bottomMargin: 10

        icon.name: "edit-copy"
        text: i18n("Create and Copy to Clipboard")

        onClicked: figlet.convert();
      }
    }
  }
}