import 'package:go_router/go_router.dart';
import 'package:stcp/widgets/homepage.dart';
import 'package:stcp/widgets/dashboard/pagoslist_page.dart';
import 'package:stcp/widgets/dashboard/consultas_page.dart';
import 'package:stcp/widgets/dashboard/detalle_pago_page.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/consultas',
      builder: (context, state) => const ConsultasPage(),
    ),
    GoRoute(
      path: '/listaConsulta',
      builder: (context, state) => const PagosListPage(),
    ),
    GoRoute(
      path: '/detallePago',
      builder: (context, state) => const DetallePagoPage(),
    ),
  ],
);
