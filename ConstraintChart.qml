import QtQuick 2.5
import QtCharts 2.2

ChartView {
    id: cstChart
    title: "Temps d'un tick (μs) = f(nombre de contraintes temporelles)"
    anchors.fill: parent
    legend.visible: true
    titleFont.pointSize: 30

    theme: ChartView.ChartThemeDark
    ValueAxis {
        id: axisX
        min: 0
        max: 100000
        tickCount: 5
    }

    ValueAxis {
        id: axisY
        min: 0
        max: 3000
    }

    LineSeries {
        id: serial
        axisX: axisX
        axisY: axisY
        name: "Série"
        XYPoint { x: 0; y: 0.119 }
        XYPoint { x: 1; y: 0.119 }
        XYPoint { x: 2; y: 0.119 }
        XYPoint { x: 5; y: 0.119 }
        XYPoint { x: 10; y: 0.119 }
        XYPoint { x: 50; y: 0.119 }
        XYPoint { x: 100; y: 0.119 }
        XYPoint { x: 200; y: 0.119 }
        XYPoint { x: 300; y: 0.119 }
        XYPoint { x: 400; y: 0.119 }
        XYPoint { x: 500; y: 0.12 }
        XYPoint { x: 600; y: 0.119 }
        XYPoint { x: 700; y: 0.12 }
        XYPoint { x: 800; y: 0.119 }
        XYPoint { x: 900; y: 0.119 }
        XYPoint { x: 1000; y: 0.12 }
        XYPoint { x: 2000; y: 0.119 }
        XYPoint { x: 3000; y: 0.119 }
        XYPoint { x: 4000; y: 0.119 }
        XYPoint { x: 5000; y: 0.119 }
        XYPoint { x: 6000; y: 0.12 }
        XYPoint { x: 7000; y: 0.119 }
        XYPoint { x: 8000; y: 0.119 }
        XYPoint { x: 9000; y: 0.119 }
        XYPoint { x: 10000; y: 0.119 }
        XYPoint { x: 20000; y: 0.119 }
        XYPoint { x: 50000; y: 0.119 }
        XYPoint { x: 100000; y: 0.128 }

    }

    LineSeries {
        id: parallel
        axisX: axisX
        axisY: axisY
        name: "Parallèle"
        XYPoint { x: 0; y: 0.129 }
        XYPoint { x: 1; y: 0.13 }
        XYPoint { x: 2; y: 0.13 }
        XYPoint { x: 5; y: 0.131 }
        XYPoint { x: 10; y: 0.133 }
        XYPoint { x: 50; y: 0.145 }
        XYPoint { x: 100; y: 0.162 }
        XYPoint { x: 200; y: 0.193 }
        XYPoint { x: 300; y: 0.253 }
        XYPoint { x: 400; y: 0.262 }
        XYPoint { x: 500; y: 0.322 }
        XYPoint { x: 600; y: 0.334 }
        XYPoint { x: 700; y: 0.382 }
        XYPoint { x: 800; y: 0.428 }
        XYPoint { x: 900; y: 0.505 }
        XYPoint { x: 1000; y: 0.481 }
        XYPoint { x: 2000; y: 1.068 }
        XYPoint { x: 3000; y: 1.693 }
        XYPoint { x: 4000; y: 2.55 }
        XYPoint { x: 5000; y: 3.239 }
        XYPoint { x: 6000; y: 5.197 }
        XYPoint { x: 7000; y: 6.519 }
        XYPoint { x: 8000; y: 8.962 }
        XYPoint { x: 9000; y: 10.387 }
        XYPoint { x: 10000; y: 12.367 }
        XYPoint { x: 20000; y: 47.553 }
        XYPoint { x: 50000; y: 351.63 }
        XYPoint { x: 100000; y: 1553.7 }
    }

    LineSeries {
        id: random
        axisX: axisX
        axisY: axisY
        name: "Aléatoire"
        XYPoint { x: 0; y: 0.14 }
        XYPoint { x: 1; y: 0.132 }
        XYPoint { x: 2; y: 0.133 }
        XYPoint { x: 5; y: 0.133 }
        XYPoint { x: 10; y: 0.134 }
        XYPoint { x: 50; y: 0.15 }
        XYPoint { x: 100; y: 0.169 }
        XYPoint { x: 200; y: 0.211 }
        XYPoint { x: 300; y: 0.256 }
        XYPoint { x: 400; y: 0.319 }
        XYPoint { x: 500; y: 0.375 }
        XYPoint { x: 600; y: 0.418 }
        XYPoint { x: 700; y: 0.486 }
        XYPoint { x: 800; y: 0.567 }
        XYPoint { x: 900; y: 0.614 }
        XYPoint { x: 1000; y: 0.689 }
        XYPoint { x: 2000; y: 1.575 }
        XYPoint { x: 3000; y: 2.809 }
        XYPoint { x: 4000; y: 4.407 }
        XYPoint { x: 5000; y: 6.271 }
        XYPoint { x: 6000; y: 8.459 }
        XYPoint { x: 7000; y: 10.925 }
        XYPoint { x: 8000; y: 13.689 }
        XYPoint { x: 9000; y: 18.115 }
        XYPoint { x: 10000; y: 22.072 }
        XYPoint { x: 20000; y: 90.511 }
        XYPoint { x: 50000; y: 605.25 }
        XYPoint { x: 100000; y: 2480.59 }
    }
}
