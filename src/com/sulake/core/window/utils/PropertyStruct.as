package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_161:String = "hex";
      
      public static const const_52:String = "int";
      
      public static const const_304:String = "uint";
      
      public static const const_244:String = "Number";
      
      public static const const_47:String = "Boolean";
      
      public static const const_85:String = "String";
      
      public static const const_209:String = "Point";
      
      public static const const_224:String = "Rectangle";
      
      public static const const_147:String = "Array";
      
      public static const const_207:String = "Map";
       
      
      private var var_577:String;
      
      private var var_164:Object;
      
      private var _type:String;
      
      private var var_2331:Boolean;
      
      private var var_2681:Boolean;
      
      private var var_2330:Array;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean, param5:Array = null)
      {
         super();
         this.var_577 = param1;
         this.var_164 = param2;
         this._type = param3;
         this.var_2331 = param4;
         this.var_2681 = param3 == const_207 || param3 == const_147 || param3 == const_209 || param3 == const_224;
         this.var_2330 = param5;
      }
      
      public function get key() : String
      {
         return this.var_577;
      }
      
      public function get value() : Object
      {
         return this.var_164;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get valid() : Boolean
      {
         return this.var_2331;
      }
      
      public function get range() : Array
      {
         return this.var_2330;
      }
      
      public function toString() : String
      {
         switch(this._type)
         {
            case const_161:
               return "0x" + uint(this.var_164).toString(16);
            case const_47:
               return Boolean(this.var_164) == true ? "true" : "false";
            case const_209:
               return "Point(" + Point(this.var_164).x + ", " + Point(this.var_164).y + ")";
            case const_224:
               return "Rectangle(" + Rectangle(this.var_164).x + ", " + Rectangle(this.var_164).y + ", " + Rectangle(this.var_164).width + ", " + Rectangle(this.var_164).height + ")";
            default:
               return String(this.value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(this._type)
         {
            case const_207:
               _loc3_ = this.var_164 as Map;
               _loc1_ = "<var key=\"" + this.var_577 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_147:
               _loc4_ = this.var_164 as Array;
               _loc1_ = "<var key=\"" + this.var_577 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_209:
               _loc5_ = this.var_164 as Point;
               _loc1_ = "<var key=\"" + this.var_577 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_52 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_52 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_224:
               _loc6_ = this.var_164 as Rectangle;
               _loc1_ = "<var key=\"" + this.var_577 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_52 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_52 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_52 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_52 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_161:
               _loc1_ = "<var key=\"" + this.var_577 + "\" value=\"" + "0x" + uint(this.var_164).toString(16) + "\" type=\"" + this._type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + this.var_577 + "\" value=\"" + this.var_164 + "\" type=\"" + this._type + "\" />";
         }
         return _loc1_;
      }
   }
}
