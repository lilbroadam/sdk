// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.6

part of dart.core;

/// Opaque name used by mirrors, invocations and [Function.apply].
abstract class Symbol {
  /** The symbol corresponding to the name of the unary minus operator. */
  static const Symbol unaryMinus = Symbol("unary-");

  /**
   * The empty symbol.
   *
   * The empty symbol is the name of libraries with no library declaration,
   * and the base-name of the unnamed constructor.
   */
  static const Symbol empty = Symbol("");

  /**
   * Constructs a new [Symbol] representing the provided name.
   *
   * The name must be a valid public Dart member name,
   * public constructor name, or library name, optionally qualified.
   *
   * A qualified name is a valid name preceded by a public identifier name
   * and a '`.`', e.g., `foo.bar.baz=` is a qualified version of `baz=`.
   * That means that the content of the [name] String must be either
   *
   * * a valid public Dart identifier
   *   (that is, an identifier not starting with "`_`"),
   * * such an identifier followed by "=" (a setter name),
   * * the name of a declarable operator
   *   (one of "`+`", "`-`", "`*`", "`/`", "`%`", "`~/`", "`&`", "`|`",
   *   "`^`", "`~`", "`<<`", "`>>`", "`<`", "`<=`", "`>`", "`>=`", "`==`",
   *   "`[]`", "`[]=`", or "`unary-`"),
   * * any of the above preceded by any number of qualifiers,
   *   where a qualifier is a non-private identifier followed by '`.`',
   * * or the empty string (the default name of a library with no library
   *   name declaration).
   *
   * Symbol instances created from the same [name] are equal,
   * but not necessarily identical, but symbols created as compile-time
   * constants are canonicalized, as all other constant object creations.
   *
   * ```dart
   * assert(new Symbol("foo") == new Symbol("foo"));
   * assert(identical(const Symbol("foo"), const Symbol("foo")));
   * ```
   *
   * If [name] is a single identifier that does not start with an underscore,
   * or it is a qualified identifier,
   * or it is an operator name different from `unary-`,
   * then the result of `const Symbol(name)` is the same instance that
   * the symbol literal created by prefixing `#` to the content of [name]
   * would evaluate to.
   *
   * ```dart
   * assert(new Symbol("foo") == #foo);
   * assert(new Symbol("[]=") == #[]=]);
   * assert(new Symbol("foo.bar") == #foo.bar);
   * assert(identical(const Symbol("foo"), #foo));
   * assert(identical(const Symbol("[]="), #[]=));
   * assert(identical(const Symbol("foo.bar"), #foo.bar));
   * ```
   *
   * This constructor cannot create a [Symbol] instance that is equal to
   * a private symbol literal like `#_foo`.
   * ```dart
   * const Symbol("_foo") // Invalid
   * ```
   *
   * The created instance overrides [Object.==].
   *
   * The following text is non-normative:
   *
   * Creating non-const Symbol instances may result in larger output.  If
   * possible, use `MirrorsUsed` from "dart:mirrors" to specify which names
   * might be passed to this constructor.
   */
  const factory Symbol(String name) = internal.Symbol;

  /**
   * Returns a hash code compatible with [operator==].
   *
   * Equal symbols have the same hash code.
   */
  int get hashCode;

  /**
   * Symbols are equal to other symbols that correspond to the same member name.
   *
   * Qualified member names, like `#foo.bar` are equal only if they have the
   * same identifiers before the same final member name.
   */
  bool operator ==(other);
}