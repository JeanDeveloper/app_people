import 'package:apppeople/domain/providers/radio_list_providers.dart';
import 'package:apppeople/presentation/pages/ingresos/widgets/widgets.dart';
import 'package:apppeople/presentation/pages/movimientos/widgets/app_bar.dart';
import 'package:apppeople/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';


class MovimientosPage extends StatefulWidget {

  const MovimientosPage({Key? key}) : super(key: key);

  @override
  State<MovimientosPage> createState() => _MovimientosPageState();

}

class _MovimientosPageState extends State<MovimientosPage> with TickerProviderStateMixin {
  
  //LOS CONTROLADORES DEL TAB Y DEL TEXTEDITING, Y LA VARIALBE DEL BUSCADOR I
  late TabController tabbarController;
  late TextEditingController searchEditingController = TextEditingController();
  bool isSearching = false;

  @override
  void initState() {

    tabbarController = TabController(length: 2, vsync:this);

    tabbarController.addListener(() =>setState((){})



    );
    super.initState();

  }

  @override
  void dispose() =>super.dispose();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SafeArea(
      top: true,
      child: Scaffold(

       
        appBar: isSearching
          ? appBarBuscando(
              (){
                setState(() => isSearching = false);
              }, 
              ()async{
                if(searchEditingController.text == '76216238'){

                  CustomProgressDialog progressDialog = CustomProgressDialog(context,blur: 10);
                  progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppTheme.lighTheme.primaryColor)));
                  progressDialog.show();

                  await Future.delayed(const Duration(seconds: 3));

                  progressDialog.dismiss();

                  Navigator.pushNamed(context, 'consultas');

                }else{
                  print('no es mi dni');
                }
              }, 
              // searchEditingController,
              (valor){print(valor);}
            )
          : appBarNoSearching(context, 'MOVIMIENTOS', startSearching),

          body: MovimientosPageBody(tabbarController: tabbarController),

      ),

    );

  }

  void startSearching() {
    setState(() {
      isSearching = true;
    });
  }

}

class MovimientosPageBody extends StatelessWidget {
  
  const MovimientosPageBody({
    Key? key,
    required this.tabbarController,
  }) : super(key: key);

  final TabController tabbarController;

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        TabBar(

          unselectedLabelColor: Colors.black,
          labelColor: Colors.orange,
          controller: tabbarController,
          tabs: const [
            Tab(text: 'DENTRO DE LA PLANTA'),
            Tab(text: 'MOVIMIENTO DEL DIA')
          ]
        
        ),

        Expanded(

          child: TabBarView(

            physics:const  NeverScrollableScrollPhysics(),
            viewportFraction: 1.0,
            
            controller: tabbarController,

            children: [

              MovimientosPlantasTabPage(index: tabbarController.index),
              MovimientosDiaTabPage(index: tabbarController.index),

            
            ]

          ),

        ),

      ],

    );


  }

}

