// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

// Tests several aspects of the TOP_MERGE algorithm for merging super-interfaces.

class A<T> {}

mixin M<T> implements A<T> {}

T deconstruct<T>(A<T> x) => throw "Unreachable";

void takesObject(Object x) {}

class D0 extends A<dynamic> with M<Object?> {
  void test() {
    var x = deconstruct(this);
    x.foo; // Check that we do not implement A<dynamic>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void>
    takesObject(x); // Check that we do not implement A<Object>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class D1 extends A<Object?> with M<dynamic> {
  void test() {
    var x = deconstruct(this);
    x.foo; // Check that we do not implement A<dynamic>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void>
    takesObject(x); // Check that we do not implement A<Object>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class D2 extends A<void> with M<Object?> {
  void test() {
    var x = deconstruct(this);
    x.foo; // Check that we do not implement A<dynamic>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void>
    takesObject(x); // Check that we do not implement A<Object>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class D3 extends A<Object?> with M<void> {
  void test() {
    var x = deconstruct(this);
    x.foo; // Check that we do not implement A<dynamic>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void>
    takesObject(x); // Check that we do not implement A<Object>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class D4 extends A<void> with M<dynamic> {
  void test() {
    var x = deconstruct(this);
    x.foo; // Check that we do not implement A<dynamic>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void>
    takesObject(x); // Check that we do not implement A<Object>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class D5 extends A<dynamic> with M<void> {
  void test() {
    var x = deconstruct(this);
    x.foo; // Check that we do not implement A<dynamic>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void>
    takesObject(x); // Check that we do not implement A<Object>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class D6 extends A<void> with M<void> {
  void test() {
    var x = deconstruct(this);
    x.foo; // Check that we do not implement A<dynamic>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<Object?>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    takesObject(x); // Check that we do not implement A<Object>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class D7 extends A<dynamic> with M<dynamic> {
  void test() {
    var x = deconstruct(this);
    x.foo; // Check that we implement A<dynamic>
  }
}

// Test the same examples with top level normalization

class ND0 extends A<FutureOr<dynamic>> with M<Object?> {
  void test() {
    var x = deconstruct(this);
    x.foo; // Check that we do not implement A<dynamic>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void>
    takesObject(x); // Check that we do not implement A<Object>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class ND1 extends A<FutureOr<Object?>> with M<dynamic> {
  void test() {
    var x = deconstruct(this);
    x.foo; // Check that we do not implement A<dynamic>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void>
    takesObject(x); // Check that we do not implement A<Object>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class ND2 extends A<FutureOr<void>> with M<Object?> {
  void test() {
    var x = deconstruct(this);
    x.foo; // Check that we do not implement A<dynamic>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void>
    takesObject(x); // Check that we do not implement A<Object>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class ND3 extends A<FutureOr<Object?>> with M<void> {
  void test() {
    var x = deconstruct(this);
    x.foo; // Check that we do not implement A<dynamic>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void>
    takesObject(x); // Check that we do not implement A<Object>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class ND4 extends A<FutureOr<void>> with M<dynamic> {
  void test() {
    var x = deconstruct(this);
    x.foo; // Check that we do not implement A<dynamic>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void>
    takesObject(x); // Check that we do not implement A<Object>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class ND5 extends A<FutureOr<dynamic>> with M<void> {
  void test() {
    var x = deconstruct(this);
    x.foo; // Check that we do not implement A<dynamic>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void>
    takesObject(x); // Check that we do not implement A<Object>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class ND6 extends A<FutureOr<void>> with M<void> {
  void test() {
    var x = deconstruct(this);
    x.foo; // Check that we do not implement A<dynamic>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<Object?>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    takesObject(x); // Check that we do not implement A<Object>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class ND7 extends A<FutureOr<dynamic>> with M<dynamic> {
  void test() {
    var x = deconstruct(this);
    x.foo; // Check that we implement A<dynamic>
  }
}

// Test the same examples with deep normalization

class DND0 extends A<FutureOr<dynamic> Function()> with M<Object? Function()> {
  void test() {
    var x = deconstruct(this)();
    x.foo; // Check that we do not implement A<dynamic Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void Function()>
    takesObject(x); // Check that we do not implement A<Object Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class DND1 extends A<FutureOr<Object?> Function()> with M<dynamic Function()> {
  void test() {
    var x = deconstruct(this)();
    x.foo; // Check that we do not implement A<dynamic Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void Function()>
    takesObject(x); // Check that we do not implement A<Object Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class DND2 extends A<FutureOr<void> Function()> with M<Object? Function()> {
  void test() {
    var x = deconstruct(this)();
    x.foo; // Check that we do not implement A<dynamic Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void Function()>
    takesObject(x); // Check that we do not implement A<Object Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class DND3 extends A<FutureOr<Object?> Function()> with M<void Function()> {
  void test() {
    var x = deconstruct(this)();
    x.foo; // Check that we do not implement A<dynamic Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void Function()>
    takesObject(x); // Check that we do not implement A<Object Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class DND4 extends A<FutureOr<void> Function()> with M<dynamic Function()> {
  void test() {
    var x = deconstruct(this)();
    x.foo; // Check that we do not implement A<dynamic Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void Function()>
    takesObject(x); // Check that we do not implement A<Object Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class DND5 extends A<FutureOr<dynamic> Function()> with M<void Function()> {
  void test() {
    var x = deconstruct(this)();
    x.foo; // Check that we do not implement A<dynamic Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void Function()>
    takesObject(x); // Check that we do not implement A<Object Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class DND6 extends A<FutureOr<void> Function()> with M<void Function()> {
  void test() {
    var x = deconstruct(this)();
    x.foo; // Check that we do not implement A<dynamic Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<Object? Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    takesObject(x); // Check that we do not implement A<Object Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class DND7 extends A<FutureOr<dynamic> Function()> with M<dynamic Function()> {
  void test() {
    var x = deconstruct(this)();
    x.foo; // Check that we implement A<dynamic Function()>
  }
}

// Test the same examples with deep normalization + typedefs

typedef Wrap<T> = FutureOr<T>? Function();

class WND0 extends A<Wrap<FutureOr<dynamic>>> with M<Wrap<Object?>> {
  void test() {
    var x = deconstruct(this)();
    x.foo; // Check that we do not implement A<dynamic Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void Function()>
    takesObject(x); // Check that we do not implement A<Object Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class WND1 extends A<Wrap<FutureOr<Object?>>> with M<Wrap<dynamic>> {
  void test() {
    var x = deconstruct(this)();
    x.foo; // Check that we do not implement A<dynamic Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void Function()>
    takesObject(x); // Check that we do not implement A<Object Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class WND2 extends A<Wrap<FutureOr<void>>> with M<Wrap<Object?>> {
  void test() {
    var x = deconstruct(this)();
    x.foo; // Check that we do not implement A<dynamic Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void Function()>
    takesObject(x); // Check that we do not implement A<Object Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class WND3 extends A<Wrap<FutureOr<Object?>>> with M<Wrap<void>> {
  void test() {
    var x = deconstruct(this)();
    x.foo; // Check that we do not implement A<dynamic Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void Function()>
    takesObject(x); // Check that we do not implement A<Object Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class WND4 extends A<Wrap<FutureOr<void>>> with M<Wrap<dynamic>> {
  void test() {
    var x = deconstruct(this)();
    x.foo; // Check that we do not implement A<dynamic Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void Function()>
    takesObject(x); // Check that we do not implement A<Object Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class WND5 extends A<Wrap<FutureOr<dynamic>>> with M<Wrap<void>> {
  void test() {
    var x = deconstruct(this)();
    x.foo; // Check that we do not implement A<dynamic Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<void Function()>
    takesObject(x); // Check that we do not implement A<Object Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class WND6 extends A<Wrap<FutureOr<void>>> with M<Wrap<void>> {
  void test() {
    var x = deconstruct(this)();
    x.foo; // Check that we do not implement A<dynamic Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    x.toString; // Check that we do not implement A<Object? Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
    takesObject(x); // Check that we do not implement A<Object Function()>
    //   ^
    // [analyzer] unspecified
    // [cfe] unspecified
  }
}

class WND7 extends A<Wrap<FutureOr<dynamic>>> with M<Wrap<dynamic>> {
  void test() {
    var x = deconstruct(this)();
    x.foo; // Check that we implement A<dynamic Function()>
  }
}
