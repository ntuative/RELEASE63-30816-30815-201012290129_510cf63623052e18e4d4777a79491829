package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_631:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_641)
         {
            _structure = null;
            _assets = null;
            var_250 = null;
            var_256 = null;
            var_561 = null;
            var_509 = null;
            var_292 = null;
            if(!var_1170 && var_39)
            {
               var_39.dispose();
            }
            var_39 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_672 = null;
            var_641 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_631[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_631[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_375:
               switch(_loc3_)
               {
                  case AvatarAction.const_703:
                  case AvatarAction.const_443:
                  case AvatarAction.const_344:
                  case AvatarAction.const_759:
                  case AvatarAction.const_330:
                  case AvatarAction.const_722:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_291:
            case AvatarAction.const_583:
            case AvatarAction.const_229:
            case AvatarAction.const_807:
            case AvatarAction.const_600:
            case AvatarAction.const_695:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
