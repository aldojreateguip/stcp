import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stcp/widgets/Login/providers/auth_providers.dart';

import 'package:stcp/widgets/homepage.dart';
import 'package:stcp/widgets/Login/check_auth_status.dart';
import 'package:stcp/widgets/dashboard/pagoslist_page.dart';
import 'package:stcp/widgets/dashboard/consultas_page.dart';
import 'package:stcp/widgets/dashboard/detalle_pago_page.dart';

import '../../widgets/register.dart';
import '../../widgets/registertwo.dart';
import '../../widgets/registerthree.dart';
import '../../widgets/registerfour.dart';
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
          path: '/registrar1',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 500),
              key: state.pageKey,
              child: const Register(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = const Offset(
                    0.0, 0.1); // Inicio de la transición desde la derecha
                var end =
                    Offset.zero; // Fin de la transición en la posición actual
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: Curves.easeInOut));
                var offsetAnimation = animation.drive(tween);

                return FadeTransition(
                  opacity: animation, // Aplica el efecto de desvanecimiento
                  child: SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  ),
                );
              },
            );
          },
        ),
        GoRoute(
          path: '/registrar2',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 500),
              key: state.pageKey,
              child: const Registertwo(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = const Offset(
                    0.1, 0.0); // Inicio de la transición desde la derecha
                var end =
                    Offset.zero; // Fin de la transición en la posición actual
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: Curves.easeInOut));
                var offsetAnimation = animation.drive(tween);

                return FadeTransition(
                  opacity: animation, // Aplica el efecto de desvanecimiento
                  child: SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  ),
                );
              },
            );
          },
        ),
        GoRoute(
          path: '/registrar3',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 500),
              key: state.pageKey,
              child: const Registerthree(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = const Offset(
                    0.1, 0.0); // Inicio de la transición desde la derecha
                var end =
                    Offset.zero; // Fin de la transición en la posición actual
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: Curves.easeInOut));
                var offsetAnimation = animation.drive(tween);

                return FadeTransition(
                  opacity: animation, // Aplica el efecto de desvanecimiento
                  child: SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  ),
                );
              },
            );
          },
        ),
        GoRoute(
          path: '/registrar4',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 500),
              key: state.pageKey,
              child: const Registerfour(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = const Offset(
                    0.1, 0.0); // Inicio de la transición desde la derecha
                var end =
                    Offset.zero; // Fin de la transición en la posición actual
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: Curves.easeInOut));
                var offsetAnimation = animation.drive(tween);

                return FadeTransition(
                  opacity: animation, // Aplica el efecto de desvanecimiento
                  child: SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  ),
                );
              },
            );
          },
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
          path: '/detallePago/:id',
          builder: (context, state) => DetallePagoPage(
            idDeuda: state.pathParameters['id'] ?? 'no-id',
          ),
        ),
      ],
      redirect: (context, state) {
        final isGoingTo = state.matchedLocation;
        final authStatus = goRouterNotifier.authStatus;

        if (isGoingTo == '/checking' && authStatus == AuthStatus.checking) {
          return null;
        }

        if (authStatus == AuthStatus.notAuthenticated) {
          if (isGoingTo.startsWith('/registrar')) {
            return isGoingTo;
          }
          return '/';
        }

        if (authStatus == AuthStatus.authenticated &&
            (isGoingTo == '/' || isGoingTo == '/checking')) {
          return '/consultas';
        }

        return null;
      });
});
