extension ListEquality on List {
    bool equals(other) {
        for(int i = 0; i < this.length; i++)
            if(this[i] != other[i])
                return false;
        return true;
    }
}

extension ObjectEquality on Object? {
    bool equals(other) {
        if(this is List || other is List)
            return (this as List).equals(other as List);
        else 
            return this == other;
    }
}
