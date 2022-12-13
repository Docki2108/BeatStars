// ignore_for_file: constant_identifier_names, unnecessary_new
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:intl/intl.dart';

const String GRAPHQL_LINK = "https://present-aphid-14.hasura.app/v1/graphql";
const String HASURA_PASSWORD =
    "Gc3ClaELB79JEzPrKD7feIaiQ26E5z8aoqe4Mnb2Dj0ESCMJPeXjlNlaUo0os6C3";

const String SUPABASE_LINK = "https://edyftbzmorkffabxutfz.supabase.co";
const String SUPABASE_ANONKEY =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVkeWZ0Ynptb3JrZmZhYnh1dGZ6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjczNjYxMzgsImV4cCI6MTk4Mjk0MjEzOH0.D4ykXnZxofIM_WnIq_iOhAuUOeH2vFPBgqdqhVXk_TU";

const clientGQL = '''query test {
  client {
    login
    password
    mail
  }
}''';

const String productPost = r'''
  query productPost {
  product {
    bpm
    duration
    genre
    id_product
    image
    info
    key
    music
    name
    price
    publish_date
    licensor_id
  }
}
''';

const String licensorsPost = r'''query licensorsPost {
  licensor {
    id_licensor
    info
    login
    mail
    name
    passport_number
    passport_series
    password
    patronymic
    surname
  }
}''';

const String clientsPost = r'''query clientsPost {
  client {
    id_client
    login
    mail
    name
    passport_number
    passport_series
    password
    patronymic
    surname
    telephone
  }
}''';

const String licencePost = r'''query licensePost {
  license {
    info
    type
    pact {
      name
      pact_date
    }
    product {
      name
    }
  }
}''';

const String productInsert =
    r'''mutation productInsert($bpm: Float, $duration: String = "", $genre: String = "", $image: String = "", $info: String = "", $key: String = "", $music: String = "", $name: String = "", $price: Int = 10, $publish_date: date = "", $licensor_id: Int = 10) {
  insert_product(objects: {bpm: $bpm, duration: $duration, genre: $genre, image: $image, info: $info, key: $key, music: $music, name: $name, price: $price, publish_date: $publish_date, licensor_id: $licensor_id}) {
    returning {
      name
      bpm
      duration
      genre
      id_product
      image
      info
      key
      music
      price
      publish_date
      licensor_id
    }
  }
}
''';

const String productDelete = r'''mutation MyMutation($id_product: Int = 10) {
  delete_product(where: {id_product: {_eq: $id_product}, music: {}}) {
    returning {
      bpm
      duration
      genre
      id_product
      image
      info
      key
      licensor_id
      music
      name
      price
      publish_date
    }
  }
}
''';

const String licensorDelete =
    r'''mutation licensorDelete($id_licensor: Int = 10) {
  delete_licensor(where: {id_licensor: {_eq: $id_licensor}}) {
    returning {
      id_licensor
      info
      login
      mail
      name
      passport_number
      passport_series
      password
      patronymic
      surname
    }
  }
}''';

const String clientDelete = r'''mutation clientDelete($id_client: Int = 10) {
  delete_client(where: {id_client: {_eq: $id_client}}) {
    returning {
      id_client
      login
      mail
      name
      passport_number
      passport_series
      password
      patronymic
      surname
      telephone
    }
  }
}''';

const String productUpdate =
    r'''mutation productUpdate($id_product: Int = 10, $name: String = "", $price: Int = 10, $key: String = "", $info: String = "", $genre: String = "", $duration: String = "", $bpm: Float = 1.5) {
  update_product_by_pk(pk_columns: {id_product: $id_product}, _set: {name: $name, price: $price, key: $key, info: $info, genre: $genre, duration: $duration, bpm: $bpm}) {
    name
  }
}''';

const String clientUpdate =
    r'''mutation clientUpdate($id_client: Int = 10, $login: String = "", $mail: String = "", $name: String = "", $passport_number: String = "", $passport_series: String = "", $password: bytea = "", $patronymic: String = "", $surname: String = "", $telephone: String = "") {
  update_client_by_pk(pk_columns: {id_client: $id_client}, _set: {login: $login, mail: $mail, name: $name, passport_number: $passport_number, passport_series: $passport_series, password: $password, patronymic: $patronymic, surname: $surname, telephone: $telephone}) {
    id_client
    login
    mail
    name
    passport_number
    passport_series
    password
    patronymic
    surname
    telephone
  }
}''';

const String licensorUpdate =
    r'''mutation licensorUpdate($id_licensor: Int = 10, $info: String = "", $login: String = "", $mail: String = "", $name: String = "", $passport_number: String = "", $passport_series: String = "", $password: bytea = "", $patronymic: String = "", $surname: String = "") {
  update_licensor_by_pk(pk_columns: {id_licensor: $id_licensor}, _set: {info: $info, login: $login, mail: $mail, name: $name, passport_number: $passport_number, passport_series: $passport_series, password: $password, patronymic: $patronymic, surname: $surname}) {
    id_licensor
    info
    login
    mail
    name
    passport_number
    passport_series
    password
    patronymic
    surname
  }
}''';

const String clientInsert =
    r'''mutation clientInsert($p_login: String = "", $p_mail: String = "", $p_name: String = "", $p_passport_number: String = "", $p_passport_series: String = "", $p_password: String = "", $p_patronymic: String = "", $p_surname: String = "", $p_telephone: String = "") {
  client_register(args: {p_login: $p_login, p_mail: $p_mail, p_name: $p_name, p_passport_number: $p_passport_number, p_passport_series: $p_passport_series, p_password: $p_password, p_patronymic: $p_patronymic, p_surname: $p_surname, p_telephone: $p_telephone}) {
    login
  }
}
''';

const String licensorInsert = r'''
  mutation licensorInsert($p_info: String = "", $p_login: String = "", $p_mail: String = "", $p_name: String = "", $p_passport_series: String = "", $p_passport_number: String = "", $p_password: String = "", $p_patronymic: String = "", $p_surname: String = "") {
  licensor_register(args: {p_info: $p_info, p_login: $p_login, p_mail: $p_mail, p_name: $p_name, p_passport_series: $p_passport_series, p_passport_number: $p_passport_number, p_password: $p_password, p_patronymic: $p_patronymic, p_surname: $p_surname}) {
    login
  }
}
''';

const String authMutation =
    r'''mutation LOGIN($p_login: String = "", $p_password: String = "") {
  clientlogin(args: {p_login: $p_login, p_password: $p_password}) {
    login
    mail
    name
    passport_number
    passport_series
    password
    patronymic
    surname
    telephone
    id_client
  }
  adminlogin(args: {p_login: $p_login, p_password: $p_password}) {
    login
    password
    id_admin
    role_id
  }
  licensorlogin(args: {p_login: $p_login, p_password: $p_password}) {
    login
    info
    mail
    name
    passport_number
    passport_series
    password
    patronymic
    surname
    id_licensor
  }
  operatorlogin(args: {p_login: $p_login, p_password: $p_password}) {
    password
    login
    id_operator
  }
}
''';

const String regQuery =
    r'''query MyQuery($_eq: String = "", $_eq1: String = "") {
  admin(where: {login: {_eq: $_eq}, password: {_eq: $_eq1}}) {
    id_admin
    login
    password
  }
  client(where: {login: {_eq: $_eq}, password: {_eq: $_eq1}}) {
    login
    password
    id_client
  }
  operator(where: {login: {_eq: $_eq}, password: {_eq: $_eq1}}) {
    login
    password
    id_operator
  }
  licensor(where: {login: {_eq: $_eq}, password: {_eq: $_eq1}}) {
    login
    password
    id_licensor
  }
}
''';

const String licensorInfo = r'''query licensorInfo($login: String = "") {
  licensor(where: {login: {_eq: $login}}) {
    id_licensor
    info
    login
    mail
    name
    passport_number
    passport_series
    password
    patronymic
    surname
  }
}
''';

const String myProductView = r'''query myProductView($licensor_id: Int = 10) {
  product(where: {licensor_id: {_eq: $licensor_id}}) {
    bpm
    duration
    genre
    id_product
    image
    info
    key
    music
    name
    price
    publish_date
  }
}
''';

const String productSearch = r'''query productSearch( $_like: String = "") {
  product(where: {name: {_like: $_like}}) {
    bpm
    duration
    genre
    id_product
    image
    info
    key
    licensor_id
    music
    name
    price
    publish_date
  }
}
''';

var maskTelephone = new MaskTextInputFormatter(
  mask: '+#(###)###-##-##',
  filter: {
    "#": RegExp(r'[0-9]'),
  },
  type: MaskAutoCompletionType.lazy,
);

var maskDuration = new MaskTextInputFormatter(
  mask: '##:##',
  filter: {
    "#": RegExp(r'[0-9]'),
  },
  type: MaskAutoCompletionType.lazy,
);

DateTime now = DateTime.now();
String dateNow = DateFormat('yyyy-MM-dd').format(now);

var maskPassportSeries = new MaskTextInputFormatter(
  mask: '####',
  filter: {
    "#": RegExp(r'[0-9]'),
  },
  type: MaskAutoCompletionType.lazy,
);

var maskPassportNumber = new MaskTextInputFormatter(
  mask: '######',
  filter: {
    "#": RegExp(r'[0-9]'),
  },
  type: MaskAutoCompletionType.lazy,
);
