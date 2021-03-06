// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.7

import "native_testing.dart";

// Hidden native class with factory constructors and NO static methods.
// Regression test.

@Native("A")
class A {
  // No static methods in this class.

  factory A(int len) => makeA(len);

  factory A.fromString(String s) => makeA(s.length);

  factory A.nativeConstructor() {
    return JS('A|Null', 'makeA(102)');
  }

  foo() native;
}

makeA(v) native;

void setup() {
  JS('', r"""
(function(){
  // This code is inside 'setup' and so not accessible from the global scope.
  function A(arg) { this._x = arg; }
  A.prototype.foo = function(){ return this._x; };
  self.makeA = function(arg) { return new A(arg); };
  self.nativeConstructor(A);
})()""");
  applyTestExtensions(['A']);
}

main() {
  nativeTesting();
  setup();
  var a1 = new A(100);
  var a2 = new A.fromString('Hello');
  var a3 = new A.nativeConstructor();

  Expect.equals(100, a1.foo());
  Expect.equals(5, a2.foo());
  Expect.equals(102, a3.foo());
}
