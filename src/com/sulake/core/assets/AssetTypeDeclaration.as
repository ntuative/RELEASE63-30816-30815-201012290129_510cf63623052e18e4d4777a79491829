package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2020:String;
      
      private var var_2021:Class;
      
      private var var_2019:Class;
      
      private var var_1491:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2020 = param1;
         this.var_2021 = param2;
         this.var_2019 = param3;
         if(rest == null)
         {
            this.var_1491 = new Array();
         }
         else
         {
            this.var_1491 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2020;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2021;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2019;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1491;
      }
   }
}
