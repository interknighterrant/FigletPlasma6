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

    function capitalizeFirstLetter(string) {
      if (string.length === 0) {
        return string;
      }
      return string.charAt(0).toUpperCase() + string.slice(1);
    }

    Layout.preferredWidth: 300
    Layout.preferredHeight: 180

    Plasma5Support.DataSource {
    id: fontFileList

    engine: "executable"
    connectedSources: ["ls -t1 /usr/share/figlet/fonts/*.flf"]

    onNewData:function(source, data) {
      var all_fonts = data.stdout.split("\n");

      var array_of_options = [];

      for( var i=0; i < all_fonts.length; i++ )
      {
        var this_font = all_fonts[i];

        this_font = this_font.replace("/usr/share/figlet/fonts/","");
        this_font = this_font.replace(".flf", "");

        var this_label = capitalizeFirstLetter( this_font );

        array_of_options.push( { value: this_font.toString(), text: this_label.toString() } );
      }

      font.model = array_of_options;
    }
  }

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
              { value: "big", text: i18n("big") }
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