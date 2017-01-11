package fovea.types {

    import starling.events.EventDispatcher;

    public class Model {

        public static function create():Object {

            var e:EventDispatcher = new EventDispatcher();
            var o:Object = {};

            o.addEventListener = e.addEventListener;
            o.setPropertyIsEnumerable("addEventListener", false);

            o.dispatchEvent = e.dispatchEvent;
            o.setPropertyIsEnumerable("dispatchEvent", false);

            o.dispatchEventWith = e.dispatchEventWith;
            o.setPropertyIsEnumerable("dispatchEventWith", false);

            o.setProp = function(k:String, v:*):Object {
                o[k] = v;
                o.dispatchEventWith("change:" + k);
                return o;
            };
            o.setPropertyIsEnumerable("setProp", false);

            o.getProp = function(k:String):* {
                return o[k];
            };
            o.setPropertyIsEnumerable("getProp", false);

            return o;
        }
    }
}
// vim:ts=4:sw=4:et
