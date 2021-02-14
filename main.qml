import QtQuick 2.12
import QtQuick.Window 2.12

//  Code réalisé à partir de :
//  https://qt.developpez.com/doc/4.7/qdeclarativemodels/

Window
{
    width: 640
    height: 480
    visible: true
    title: qsTr("Liste pointeaux")

    Rectangle
    {
        width: 200; height: 90
        border.width: 2
        radius: 5
        x:50
        y:100

        ListModel
        {
            id: modelPointeaux // Données -> liste de pointeaux

            ListElement {
                lieu: "Accueil"
                etat : "red"
            }
            ListElement {
                lieu: "Salle B106"
                etat: "blue"
            }
            ListElement {
                lieu: "Salle B107"
                etat: "green"
            }

            ListElement {
                lieu: "Salle B108"
                etat : "gray"
            }
            ListElement {
                lieu: "Salle B112"
                etat: "orange"
            }
            ListElement {
                lieu: "Salle B113"
                etat: "brown"
            }
        }

        Component
        {
            id: representation // Manière dont s'affiche les données
            Row
            {
                height: 30
                spacing: 10

                Text { text: " " } // pour ne pas coller la représentation graphique
                Column
                {
                    Rectangle       // premier rectangle
                    {
                        x:5
                        width: 5
                        height: 8
                        color: "black"
                    }
                    Rectangle       // rond
                    {
                        height: 15;
                        width: 14;
                        color: etat
                        radius: 20
                    }
                    Rectangle   // deuxième rectangle
                    {
                        x:5
                        width: 5
                        height: 8
                        color: "black"
                    }
                }
                Text    //  texte correspondant
                {
                    y:8
                    text: "Désignation : " + lieu
                }
            }
        }

        ListView
        {
            anchors.fill: parent
            model: modelPointeaux
            delegate: representation
        }
    }
}
