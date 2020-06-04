package fovea.types {

    // A parametrized string
    //
    // Example:
    //
    //   CurlyString.of(["Hello {1} {2}", "John", "Doe"]).toString()
    //   -> "Hello John Doe"
    //
    public class CurlyString {

        private var _args:Array;
        public function key():String { return _args[0]; }
        public function args():Array { return _args.slice(1); }

        public function CurlyString(args:Array) {
            _args = args;
            if (!args || args.length < 1) {
                throw new Error("Invalid CurlyString");
            }
        }

        public static function of(args:Array):CurlyString {
            return new CurlyString(args);
        }

        public static function ofKeyArgs(key:String, args:Array):CurlyString {
            return new CurlyString([key].concat(args));
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

