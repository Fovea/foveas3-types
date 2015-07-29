package fovea.types {

    public class CurlyString {

        private var _args:Array;
        public function key():String { return _args[0]; }
        public function args():Array { return _args; }

        public function CurlyString(args:Array) {
            _args = args;
            if (!args || args.length < 1) {
                throw new Error("Invalid CurlyString");
            }
        }

        public function toString():String {
            var s:String = _args[0];
            for (var i:int = 1; i < _args.length; ++i)
                s = _replaceArg(s, i, _args[i]);
            return s;
        }

        private static function _replaceArg(s:String, index:int, arg:String):String {
            return s.replace("{" + index + "}", arg);
        }
    }
}
// vim: ts=4:sw=4:et:

