package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1103:int;
      
      private var var_2128:String;
      
      private var var_2129:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1103 = param1.readInteger();
         this.var_2128 = param1.readString();
         this.var_2129 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_1103;
      }
      
      public function get requesterName() : String
      {
         return this.var_2128;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2129;
      }
   }
}
