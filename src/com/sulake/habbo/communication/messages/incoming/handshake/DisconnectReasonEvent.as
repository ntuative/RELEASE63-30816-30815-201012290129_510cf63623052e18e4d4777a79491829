package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1735:int = 0;
      
      public static const const_1254:int = 1;
      
      public static const const_1373:int = 2;
      
      public static const const_1652:int = 3;
      
      public static const const_1606:int = 4;
      
      public static const const_1638:int = 5;
      
      public static const const_1422:int = 10;
      
      public static const const_1772:int = 11;
      
      public static const const_1748:int = 12;
      
      public static const const_1607:int = 13;
      
      public static const const_1677:int = 16;
      
      public static const const_1694:int = 17;
      
      public static const const_1679:int = 18;
      
      public static const const_1807:int = 19;
      
      public static const const_1793:int = 20;
      
      public static const const_1648:int = 22;
      
      public static const const_1658:int = 23;
      
      public static const const_1717:int = 24;
      
      public static const const_1659:int = 25;
      
      public static const const_1671:int = 26;
      
      public static const const_1741:int = 27;
      
      public static const const_1761:int = 28;
      
      public static const const_1767:int = 29;
      
      public static const const_1785:int = 100;
      
      public static const const_1765:int = 101;
      
      public static const const_1676:int = 102;
      
      public static const const_1812:int = 103;
      
      public static const const_1790:int = 104;
      
      public static const const_1749:int = 105;
      
      public static const const_1653:int = 106;
      
      public static const const_1640:int = 107;
      
      public static const const_1786:int = 108;
      
      public static const const_1801:int = 109;
      
      public static const const_1745:int = 110;
      
      public static const const_1690:int = 111;
      
      public static const const_1753:int = 112;
      
      public static const const_1673:int = 113;
      
      public static const const_1645:int = 114;
      
      public static const const_1636:int = 115;
      
      public static const const_1723:int = 116;
      
      public static const const_1599:int = 117;
      
      public static const const_1795:int = 118;
      
      public static const const_1728:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1254:
            case const_1422:
               return "banned";
            case const_1373:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
