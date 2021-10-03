package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1468:int;
      
      private var _name:String;
      
      private var var_1413:int;
      
      private var var_1976:int;
      
      private var var_1979:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_561:String;
      
      private var var_1980:int;
      
      private var var_1978:int;
      
      private var var_1975:int;
      
      private var var_1977:int;
      
      private var var_1974:int;
      
      private var _ownerName:String;
      
      private var var_450:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1468;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1413;
      }
      
      public function get maxLevel() : int
      {
         return this.var_1976;
      }
      
      public function get experience() : int
      {
         return this.var_1979;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_561;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_1980;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_1978;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_1975;
      }
      
      public function get respect() : int
      {
         return this.var_1977;
      }
      
      public function get ownerId() : int
      {
         return this.var_1974;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_450;
      }
      
      public function flush() : Boolean
      {
         this.var_1468 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1468 = param1.readInteger();
         this._name = param1.readString();
         this.var_1413 = param1.readInteger();
         this.var_1976 = param1.readInteger();
         this.var_1979 = param1.readInteger();
         this.var_1980 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_1978 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_1975 = param1.readInteger();
         this.var_561 = param1.readString();
         this.var_1977 = param1.readInteger();
         this.var_1974 = param1.readInteger();
         this.var_450 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
