package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2618:String;
      
      private var var_1856:String;
      
      private var var_2617:String;
      
      private var var_1854:Boolean;
      
      private var var_1855:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2618 = String(param1["set-type"]);
         this.var_1856 = String(param1["flipped-set-type"]);
         this.var_2617 = String(param1["remove-set-type"]);
         this.var_1854 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1855 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1855;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1855 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2618;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1856;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2617;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1854;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1854 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1856 = param1;
      }
   }
}
