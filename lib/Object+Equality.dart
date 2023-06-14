import "package:collection/collection.dart";

extension DspecDeprecatedEquality on Deprecated {
    bool dspec_if_same(other) => this.message == other.message;
}

extension DspecExpandoEquality on Expando {
    bool dspec_if_same(other) => this.name == other.name;
}

extension DspecFunctionEquality on Function {
    bool dspec_if_same(other) => this.toString() == other.toString();
}

extension DspecListEquality on List {
    bool dspec_if_same(other) => DeepCollectionEquality().equals(this, other);
}

extension DspecMapEquality on Map {
    bool dspec_if_same(other) => DeepCollectionEquality().equals(this, other);
}

extension DspecMapEntryEquality on MapEntry {
    bool dspec_if_same(other) =>
        this.key == other.key
        && this.value == other.value;
}

extension DspecPragmaEquality on pragma {
    bool dspec_if_same(other) => this.name == other.name;
}

extension DspecRuneIteratorEquality on RuneIterator {
    bool dspec_if_same(other) => this.string == other.string;
}

extension DspecRunesEquality on Runes {
    bool dspec_if_same(other) => this.string == other.string;
}

extension DspecSetEquality on Set {
    bool dspec_if_same(other) => DeepCollectionEquality().equals(this, other);
}

extension DspecStackTraceEquality on StackTrace {
    bool dspec_if_same(other) => this.toString() == other.toString();
}

extension DspecStringBufferEquality on StringBuffer {
    bool dspec_if_same(other) => this.toString() == other.toString();
}

extension DspecUriDataEquality on UriData {
    bool dspec_if_same(other) => this.contentText == other.contentText;
}

// TODO Test Futures and Streams

extension DspecObjectEquality on Object? {
    bool dspec_if_same(other) {
        if(this is Deprecated && other is Deprecated)
            return (this as Deprecated).dspec_if_same(other);
        else if(this is Expando && other is Expando)
            return (this as Expando).dspec_if_same(other);
        else if(this is Function && other is Function)
            return (this as Function).dspec_if_same(other);
        else if(this is List && other is List)
            return (this as List).dspec_if_same(other);
        else if(this is Map && other is Map)
            return (this as Map).dspec_if_same(other);
        else if(this is MapEntry && other is MapEntry)
            return (this as MapEntry).dspec_if_same(other);
        else if(this is pragma && other is pragma)
            return (this as pragma).dspec_if_same(other);
        else if(this is RuneIterator && other is RuneIterator)
            return (this as RuneIterator).dspec_if_same(other);
        else if(this is Runes && other is Runes)
            return (this as Runes).dspec_if_same(other);
        else if(this is Set && other is Set)
            return (this as Set).dspec_if_same(other);
        else if(this is StackTrace && other is StackTrace)
            return (this as StackTrace).dspec_if_same(other);
        else if(this is StringBuffer && other is StringBuffer)
            return (this as StringBuffer).dspec_if_same(other);
        else if(this is UriData && other is UriData)
            return (this as UriData).dspec_if_same(other);
        else
            return this == other;
    }
}
