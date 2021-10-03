package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetExperienceParser implements IMessageParser
   {
       
      
      private var var_1468:int = -1;
      
      private var _petRoomIndex:int = -1;
      
      private var var_2042:int = 0;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      public function PetExperienceParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1468;
      }
      
      public function get method_9() : int
      {
         return this._petRoomIndex;
      }
      
      public function get gainedExperience() : int
      {
         return this.var_2042;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1468 = param1.readInteger();
         this._petRoomIndex = param1.readInteger();
         this.var_2042 = param1.readInteger();
         return true;
      }
   }
}
