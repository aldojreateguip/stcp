import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stcp/widgets/Login/providers/auth_providers.dart';

import 'package:stcp/widgets/homepage.dart';
import 'package:stcp/widgets/Login/check_auth_status.dart';
import 'package:stcp/widgets/dashboard/pagoslist_page.dart';
import 'package:stcp/widgets/dashboard/consultas_page.dart';
import 'package:stcp/widgets/dashboard/detalle_pago_page.dart';

import 'app_router_notifier.dart';

final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);
  return GoRouter(
      initialLocation: '/',
      refreshListenable: goRouterNotifier,
      routes: [
        GoRoute(
          path: '/checking',
          builder: (context, state) => const CheckAthStatusPage(),
        ),
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
      redirect: (context, state) {
        final isGoingTo = state.matchedLocation;
        final authStatus = goRouterNotifier.authStatus;
        if (isGoingTo == '/checking' && authStatus == AuthStatus.checking)
          return null;
        if (authStatus == AuthStatus.notAuthenticated) {
          if (isGoingTo == '/') return null;
          return '/';
        }
        if (authStatus == AuthStatus.authenticated) {
          if (isGoingTo == '/' || isGoingTo == '/checking') return '/consultas';
        }
        return null;
      });
});
