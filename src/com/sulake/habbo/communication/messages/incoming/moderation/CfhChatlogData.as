package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1615:int;
      
      private var var_2228:int;
      
      private var var_1288:int;
      
      private var var_2204:int;
      
      private var var_105:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1615 = param1.readInteger();
         this.var_2228 = param1.readInteger();
         this.var_1288 = param1.readInteger();
         this.var_2204 = param1.readInteger();
         this.var_105 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1615);
      }
      
      public function get callId() : int
      {
         return this.var_1615;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2228;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1288;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2204;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_105;
      }
   }
}
