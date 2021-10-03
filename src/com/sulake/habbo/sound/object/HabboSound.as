package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_1080:Sound = null;
      
      private var _soundChannel:SoundChannel = null;
      
      private var var_454:Number;
      
      private var var_1338:Boolean;
      
      public function HabboSound(param1:Sound)
      {
         super();
         this.var_1080 = param1;
         this.var_1080.addEventListener(Event.COMPLETE,this.onComplete);
         this.var_454 = 1;
         this.var_1338 = false;
      }
      
      public function play() : Boolean
      {
         this.var_1338 = false;
         this._soundChannel = this.var_1080.play(0);
         this.volume = this.var_454;
         return true;
      }
      
      public function stop() : Boolean
      {
         this._soundChannel.stop();
         return true;
      }
      
      public function get volume() : Number
      {
         return this.var_454;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_454 = param1;
         if(this._soundChannel != null)
         {
            this._soundChannel.soundTransform = new SoundTransform(this.var_454);
         }
      }
      
      public function get position() : Number
      {
         return this._soundChannel.position;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get length() : Number
      {
         return this.var_1080.length;
      }
      
      public function get ready() : Boolean
      {
         return !this.var_1080.isBuffering;
      }
      
      public function get finished() : Boolean
      {
         return !this.var_1338;
      }
      
      private function onComplete(param1:Event) : void
      {
         this.var_1338 = true;
      }
   }
}
