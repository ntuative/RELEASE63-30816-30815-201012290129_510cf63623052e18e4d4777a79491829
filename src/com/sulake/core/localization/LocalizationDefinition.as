package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var var_1814:String;
      
      private var var_1812:String;
      
      private var var_1813:String;
      
      private var _name:String;
      
      private var var_945:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         this.var_1814 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         this.var_1812 = _loc5_[0];
         this.var_1813 = _loc5_[1];
         this._name = param2;
         this.var_945 = param3;
      }
      
      public function get id() : String
      {
         return this.var_1814 + "_" + this.var_1812 + "." + this.var_1813;
      }
      
      public function get languageCode() : String
      {
         return this.var_1814;
      }
      
      public function get countryCode() : String
      {
         return this.var_1812;
      }
      
      public function get encoding() : String
      {
         return this.var_1813;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get url() : String
      {
         return this.var_945;
      }
   }
}
