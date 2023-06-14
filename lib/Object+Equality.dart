extension DeprecatedEquality on Deprecated {
    bool dspec_if_same(other) => this.message == other.message;
}

extension ExpandoEquality on Expando {
    bool dspec_if_same(other) => this.name == other.name;
}

extension FunctionEquality on Function {
    bool dspec_if_same(other) => this.toString() == other.toString();
}

extension ListEquality on List {
    bool dspec_if_same(other) {
        if(this.length != other.length)
            return false;

        for(int i = 0; i < this.length; i++)
            if(this[i] != other[i])
                return false;
        return true;
    }
}

extension MapEquality on Map {
    bool dspec_if_same(other) {
        if(this.length != other.length)
            return false;

        var thiskeys = this.keys.toList();
        var thisvalues = this.values.toList();
        var otherkeys = other.keys.toList();
        var othervalues = other.values.toList();

        for(int i = 0; i < this.length; i++)
            if(thiskeys[i]!= otherkeys[i]
            || thisvalues[i]!= othervalues[i])
                return false;
        return true;
    }
}

extension MapEntryEquality on MapEntry {
    bool dspec_if_same(other) =>
        this.key == other.key
        && this.value == other.value;
}

extension PragmaEquality on pragma {
    bool dspec_if_same(other) => this.name == other.name;
}

extension RuneIteratorEquality on RuneIterator {
    bool dspec_if_same(other) => this.string == other.string;
}

extension RunesEquality on Runes {
    bool dspec_if_same(other) => this.string == other.string;
}

extension SetEquality on Set {
    bool dspec_if_same(other) {
        if(this.length != other.length)
            return false;
        else
            return this.containsAll(other);
    }
}

extension StackTraceEquality on StackTrace {
    bool dspec_if_same(other) => this.toString() == other.toString();
}

extension StringBufferEquality on StringBuffer {
    bool dspec_if_same(other) => this.toString() == other.toString();
}

extension UriDataEquality on UriData {
    bool dspec_if_same(other) => this.contentText == other.contentText;
}

extension ObjectEquality on Object? {
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
