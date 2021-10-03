package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_770:String = "RWUAM_WHISPER_USER";
      
      public static const const_570:String = "RWUAM_IGNORE_USER";
      
      public static const const_780:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_473:String = "RWUAM_KICK_USER";
      
      public static const const_649:String = "RWUAM_BAN_USER";
      
      public static const const_791:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_788:String = "RWUAM_RESPECT_USER";
      
      public static const const_563:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_766:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_793:String = "RWUAM_START_TRADING";
      
      public static const const_757:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_505:String = "RWUAM_KICK_BOT";
      
      public static const const_639:String = "RWUAM_REPORT";
      
      public static const const_494:String = "RWUAM_PICKUP_PET";
      
      public static const const_1262:String = "RWUAM_TRAIN_PET";
      
      public static const const_516:String = " RWUAM_RESPECT_PET";
      
      public static const const_346:String = "RWUAM_REQUEST_PET_UPDATE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
