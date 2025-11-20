import QtQuick 2.0
import QtQuick.Layouts 1.0
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid
import org.kde.kirigami as Kirigami

PlasmoidItem {
  id: root
  preferredRepresentation: compactRepresentation
  fullRepresentation: ColumnLayout{
    PlasmaComponents.TextField {
      id: textToConvert
      placeholderText: qsTr("Enter Text to Create ASCII Art Text")
    }
    PlasmaComponents.CheckBox {
      id: limitWidth
      checked: true
      text: qsTr("Limit Width to 80 Characters")
    }
    PlasmaComponents.ComboBox {
      id: font
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
    PlasmaComponents.TextField {
      id: startLinesWith
      placeholderText: qsTr("Characters to add before each line")
    }
  }
}