
import QtQuick 2.5
import QtCharts 2.2
import QtQuick.Controls 2.2
Item {
    anchors.fill: parent
    SwipeView {
        anchors.fill: parent


        ChartView {
            title: "Lecture oscquery (μs) = f(nombre de nœuds)"
            legend.visible: true
            titleFont.pointSize: 30
            antialiasing: true
            animationDuration: 3000
            animationOptions: ChartView.AllAnimations
            theme: ChartView.ChartThemeDark


            LineSeries {
                axisX:
                    ValueAxis {
                        min: 0
                        max: 20000
                        tickCount: 5
                    }
                axisY:
                    ValueAxis {
                        min: 0
                        max: 11500
                    }
                XYPoint { x: 0 ; y:11  }
                XYPoint { x: 1 ; y:28  }
                XYPoint { x: 2 ; y:5  }
                XYPoint { x: 5 ; y:7  }
                XYPoint { x: 10 ; y:41  }
                XYPoint { x: 50 ; y:30  }
                XYPoint { x: 100 ; y:57  }
                XYPoint { x: 200 ; y:269  }
                XYPoint { x: 300 ; y:234  }
                XYPoint { x: 400 ; y:374  }
                XYPoint { x: 500 ; y:290  }
                XYPoint { x: 600 ; y:343  }
                XYPoint { x: 700 ; y:550  }
                XYPoint { x: 800 ; y:414  }
                XYPoint { x: 900 ; y:460  }
                XYPoint { x: 1000 ; y:692  }
                XYPoint { x: 2000 ; y:1317  }
                XYPoint { x: 3000 ; y:1585  }
                XYPoint { x: 4000 ; y:2325  }
                XYPoint { x: 5000 ; y:2853  }
                XYPoint { x: 6000 ; y:3126  }
                XYPoint { x: 7000 ; y:3780  }
                XYPoint { x: 8000 ; y:4325  }
                XYPoint { x: 9000 ; y:4732  }
                XYPoint { x: 10000 ; y:5156  }
                XYPoint { x: 20000 ; y:11220  }
            }
        }

        ChartView {
            title: "Écriture oscquery (ms) = f(nombre de nœuds)"
            legend.visible: true
            titleFont.pointSize: 30
            antialiasing: true
            animationDuration: 3000
            animationOptions: ChartView.AllAnimations
            theme: ChartView.ChartThemeDark
            ValueAxis {
                min: 0
                max: 20000
                tickCount: 5
            }

            ValueAxis {
                min: 0
                max: 3000
            }

            LineSeries {
                axisX:
                    ValueAxis {
                        min: 0
                        max: 20000
                        tickCount: 5
                    }
                axisY:
                    ValueAxis {
                        min: 0
                        max: 3000
                    }
                XYPoint { x: 0 ; y: 40019/ 1000 }
                XYPoint { x: 1 ; y: 40005/ 1000 }
                XYPoint { x: 2 ; y: 39864/ 1000 }
                XYPoint { x: 5 ; y: 40001/ 1000 }
                XYPoint { x: 10 ; y: 40209/ 1000 }
                XYPoint { x: 50 ; y: 39990/ 1000 }
                XYPoint { x: 100 ; y: 39825/ 1000 }
                XYPoint { x: 200 ; y: 43008/ 1000 }
                XYPoint { x: 300 ; y: 41915/ 1000 }
                XYPoint { x: 400 ; y: 41865/ 1000 }
                XYPoint { x: 500 ; y: 43798/ 1000 }
                XYPoint { x: 600 ; y: 45831/ 1000 }
                XYPoint { x: 700 ; y: 44878/ 1000 }
                XYPoint { x: 800 ; y: 46410/ 1000 }
                XYPoint { x: 900 ; y: 48554/ 1000 }
                XYPoint { x: 1000 ; y: 50291/ 1000 }
                XYPoint { x: 2000 ; y: 71937/ 1000 }
                XYPoint { x: 3000 ; y: 113964/ 1000 }
                XYPoint { x: 4000 ; y: 169478/ 1000 }
                XYPoint { x: 5000 ; y: 235974/ 1000 }
                XYPoint { x: 6000 ; y: 327839/ 1000 }
                XYPoint { x: 7000 ; y: 431136/ 1000 }
                XYPoint { x: 8000 ; y: 532074/ 1000 }
                XYPoint { x: 9000 ; y: 700668/ 1000 }
                XYPoint { x: 10000 ; y: 852747/ 1000 }
                XYPoint { x: 20000 ; y: 3000066/ 1000 }


            }
        }

    }
}

