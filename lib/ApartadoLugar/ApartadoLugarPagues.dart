import 'package:flutter/material.dart';
class AparadoPagues extends StatefulWidget {
  @override
  _AparadoPaguesState createState() => _AparadoPaguesState();
}

class _AparadoPaguesState extends State<AparadoPagues> {
  var _menuApartadoES=['Edificio A', 'Edificio B', ];
  String _vistaMenuApartado = 'Selecciona';
  var _menuLugares=['A1','A2','A3','A4','A5','A6','A7' ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(constraints: BoxConstraints(maxWidth: 900),
                child: Column(
                  
                  children: [
                    SizedBox(height: 30,),    
         WaveBall(
          circleColor: Colors.white,
          progress: 0.5,
          child: Center(
            child: Text(
              'Tiempo restante de Apartado 10 Min',
              style: TextStyle(color: Colors.green, fontSize: 15 , fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),

SizedBox(height: 30),
      Text('Lugar de Estacionamiento', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
        

SizedBox(height: 30,),

ListTile(
  title: Text('Estacionamiento'),
  trailing: DropdownButton(
    items: _menuApartadoES.map((String c){
      return DropdownMenuItem(
        value: c,
        child: Text(c),);

    }).toList(),
    onChanged: (_value)=>{
      setState((){
        _vistaMenuApartado = _value;
      })
    },
    hint: Text(_vistaMenuApartado),
  ),
),
ListTile(
  title: Text('Luagres'),
  trailing: DropdownButton(
    items: _menuLugares.map((String c){
      return DropdownMenuItem(
        value: c,
        child: Text(c),);

    }).toList(),
    onChanged: (_value)=>{
      setState((){
        _vistaMenuApartado = _value;
      })
    },
    hint: Text(_vistaMenuApartado),
  ),
),

      RaisedButton(
        color: Colors.red,
            child: Text('Apartar Lugar', style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: (){},)
                ],),
              ),
            ),
            )
          ),
        ],

      ),
    );
  }
}


const int WaveCount = 4;

class WaveBall extends StatefulWidget {
  final double progress;
  final double size;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color circleColor;
  final Widget child;
  final double range;
  final Duration duration;

  const WaveBall({
    Key key,
    this.size = 150.0,
    this.progress = 0.0,
    this.foregroundColor = Colors.yellow,
    this.backgroundColor = Colors.yellowAccent,
    this.circleColor = Colors.grey,
    this.child,
    this.duration = const Duration(seconds: 2),
    this.range = 20.0,
  })  : assert(progress >= 0.0 && progress <= 1.0),
        super(key: key);

  @override
  _WaveBallState createState() => _WaveBallState();
}

class _WaveBallState extends State<WaveBall> with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          constraints: BoxConstraints.tightFor(
            height: widget.size,
            width: widget.size,
          ),
          child: CustomPaint(
            painter: WaveBallPainter(
              animationValue: controller.value,
              range: widget.range,
              progress: widget.progress,
              foregroundColor: widget.foregroundColor,
              backgroundColor: widget.backgroundColor,
              circleColor: widget.circleColor,
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}

class WaveBallPainter extends CustomPainter {
  final double progress;
  final double animationValue;
  final double range;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color circleColor;

  WaveBallPainter({
    this.foregroundColor,
    this.circleColor,
    this.backgroundColor,
    this.animationValue,
    this.progress = 0.0,
    this.range = 10.0,
  })  : assert(animationValue >= 0.0 && animationValue <= 1.0),
        assert(progress >= 0.0 && progress <= 1.0);

  @override
  void paint(Canvas canvas, Size size) {
    double levelHeight = (1.0 - progress) * size.height;
    double specWidget = size.width / WaveCount;
    double translateX = size.width * animationValue;
    double translateX2 = size.width * (1 - animationValue);

    Path path = new Path();
    path.moveTo(0 - translateX, size.height);
    path.lineTo(0 - translateX, levelHeight);
    for (int i = 1; i <= WaveCount; i++) {
      double controllerX = specWidget * (i * 2 - 1) - translateX;
      double controllerY = i % 2 == 0 ? levelHeight - range : levelHeight + range;
      double toX = specWidget * (2 * i) - translateX;
      path.quadraticBezierTo(controllerX, controllerY, toX, levelHeight);
    }
    path.lineTo(size.width + translateX, size.height);
    path.close();

    Path path2 = new Path();
    path2.moveTo(0 - translateX2, size.height);
    path2.lineTo(0 - translateX2, levelHeight);
    for (int i = 1; i <= WaveCount; i++) {
      double controllerX = specWidget * (i * 2 - 1) - translateX2;
      double controllerY = i % 2 != 0 ? levelHeight - range : levelHeight + range;
      double toX = specWidget * (2 * i) - translateX2;

      path2.quadraticBezierTo(controllerX, controllerY, toX, levelHeight);
    }
    path2.lineTo(size.width + translateX2, size.height);
    path2.close();

    Path path3 = new Path();
    path3.addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2));
    path3.close();

    canvas.clipPath(path3, doAntiAlias: true);

    Paint mPaint = new Paint();

    mPaint.style = PaintingStyle.fill;
    mPaint.isAntiAlias = true;

    mPaint.color = circleColor;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, mPaint);

    mPaint.color = backgroundColor;
    canvas.drawPath(path2, mPaint);

    mPaint.color = foregroundColor;
    canvas.drawPath(path, mPaint);
  }

  @override
  bool shouldRepaint(WaveBallPainter oldDelegate) {
    return oldDelegate.animationValue != this.animationValue ||
        oldDelegate.range != this.range ||
        oldDelegate.progress != this.progress ||
        oldDelegate.backgroundColor != this.backgroundColor ||
        oldDelegate.foregroundColor != this.foregroundColor ||
        oldDelegate.circleColor != this.circleColor;
  }
}
