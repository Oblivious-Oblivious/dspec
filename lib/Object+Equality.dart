import "package:collection/collection.dart";

extension DspecDeprecatedEquality on Deprecated {
    bool dspecIfSame(other) => this.message == other.message;
}

extension DspecExpandoEquality on Expando {
    bool dspecIfSame(other) => this.name == other.name;
}

extension DspecFunctionEquality on Function {
    bool dspecIfSame(other) => this.toString() == other.toString();
}

extension DspecListEquality on List {
    bool dspecIfSame(other) => DeepCollectionEquality().equals(this, other);
}

extension DspecMapEquality on Map {
    bool dspecIfSame(other) => DeepCollectionEquality().equals(this, other);
}

extension DspecMapEntryEquality on MapEntry {
    bool dspecIfSame(other) =>
        this.key == other.key
        && this.value == other.value;
}

extension DspecPragmaEquality on pragma {
    bool dspecIfSame(other) => this.name == other.name;
}

extension DspecRuneIteratorEquality on RuneIterator {
    bool dspecIfSame(other) => this.string == other.string;
}

extension DspecRunesEquality on Runes {
    bool dspecIfSame(other) => this.string == other.string;
}

extension DspecSetEquality on Set {
    bool dspecIfSame(other) => DeepCollectionEquality().equals(this, other);
}

extension DspecStackTraceEquality on StackTrace {
    bool dspecIfSame(other) => this.toString() == other.toString();
}

extension DspecStringBufferEquality on StringBuffer {
    bool dspecIfSame(other) => this.toString() == other.toString();
}

extension DspecUriDataEquality on UriData {
    bool dspecIfSame(other) => this.contentText == other.contentText;
}

// TODO Test Futures and Streams

extension DspecObjectEquality on Object? {
    bool dspecIfSame(other) {
        if(this is Deprecated && other is Deprecated)
            return (this as Deprecated).dspecIfSame(other);
        else if(this is Expando && other is Expando)
            return (this as Expando).dspecIfSame(other);
        else if(this is Function && other is Function)
            return (this as Function).dspecIfSame(other);
        else if(this is List && other is List)
            return (this as List).dspecIfSame(other);
        else if(this is Map && other is Map)
            return (this as Map).dspecIfSame(other);
        else if(this is MapEntry && other is MapEntry)
            return (this as MapEntry).dspecIfSame(other);
        else if(this is pragma && other is pragma)
            return (this as pragma).dspecIfSame(other);
        else if(this is RuneIterator && other is RuneIterator)
            return (this as RuneIterator).dspecIfSame(other);
        else if(this is Runes && other is Runes)
            return (this as Runes).dspecIfSame(other);
        else if(this is Set && other is Set)
            return (this as Set).dspecIfSame(other);
        else if(this is StackTrace && other is StackTrace)
            return (this as StackTrace).dspecIfSame(other);
        else if(this is StringBuffer && other is StringBuffer)
            return (this as StringBuffer).dspecIfSame(other);
        else if(this is UriData && other is UriData)
            return (this as UriData).dspecIfSame(other);
        else
            return this == other;
    }
}
