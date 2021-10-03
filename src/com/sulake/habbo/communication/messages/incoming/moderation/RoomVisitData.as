package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_1779:Boolean;
      
      private var _roomId:int;
      
      private var var_909:String;
      
      private var var_2310:int;
      
      private var var_2309:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1779 = param1.readBoolean();
         this._roomId = param1.readInteger();
         this.var_909 = param1.readString();
         this.var_2310 = param1.readInteger();
         this.var_2309 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return this.var_1779;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomName() : String
      {
         return this.var_909;
      }
      
      public function get enterHour() : int
      {
         return this.var_2310;
      }
      
      public function get enterMinute() : int
      {
         return this.var_2309;
      }
   }
}
