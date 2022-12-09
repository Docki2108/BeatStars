import 'package:beat/back/constant.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GRaphQLProvider {
  static GraphQLClient client = GraphQLClient(
      link: HttpLink(GRAPHQL_LINK, defaultHeaders: {
        'content-type': 'application/json',
        'x-hasura-admin-secret':
            'Gc3ClaELB79JEzPrKD7feIaiQ26E5z8aoqe4Mnb2Dj0ESCMJPeXjlNlaUo0os6C3'
      }),
      cache: GraphQLCache());
}
