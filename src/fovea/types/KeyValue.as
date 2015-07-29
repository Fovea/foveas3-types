package fovea.types {

    public class KeyValue {

        private var _key:String;
        public function get key():String { return _key; }

        private var _value:*;
        public function get value():* { return _value; }

        public function KeyValue(key:String, value:*) {
            _key = key;
            _value = value;
        }

        public function inject(obj:Object):void {
            obj[key] = value;
        }

        // createObject :: [KeyValue] -> Object
        public static function createObject(keyValues:Array):Object {
            var out:Object = {};
            for (var i:int = 0; i < keyValues.length; ++i)
                keyValues[i].inject(out);
            return out;
        }
    }
}
// vim: ts=4:sw=4:et:
