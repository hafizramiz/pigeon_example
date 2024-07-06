package com.example.pigeon_example

import android.content.Context
import android.os.BatteryManager
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.widget.Toast
import androidx.annotation.RequiresApi
import androidx.core.content.ContextCompat.getSystemService


/// Note: Imortlar kendiliginden gelmez bizim eklememiz gerekiyor
/// Burdaki importlar kendiliginden gelmez. Cunku burasi komple flutter'i goruyor
/// Ilgili projenin android dosyasini ayrica bir android projesi acar gibi acarsaniz. O zaman importlar siz kod yazdikca gelir
/// Bunun icinde android folder'a gelip sag tiklarsaniz. Flutter-> Open Android Module in Android Studio Gorursunuz
/// Ilgili folder'i Android studio'da acip kodunuzu bir android projesi yazar gibi yazarsiniz.
class MainActivity: FlutterActivity() {
private  val  channelName="exampleMethodChannel"

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    override fun  configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
      val method=MethodChannel(flutterEngine.dartExecutor.binaryMessenger,channelName)

        method.setMethodCallHandler{
            call,result->
            if(call.method=="getBatteryLevel"){
                //Toast.makeText(this,"getBatteryLevel",Toast.LENGTH_SHORT).show()
                val batteryLevel= getBatteryLevel(this)
                Toast.makeText(this,"battery level: ${batteryLevel}",Toast.LENGTH_SHORT).show()
                if(batteryLevel!=-1){
                    result.success(batteryLevel)
                }else{
                    result.error("UNAVAILABLE","Battery level not available",null)
                }
            }else{
                result.notImplemented()
            }
        }
    }

}





@RequiresApi(Build.VERSION_CODES.LOLLIPOP)
fun getBatteryLevel(context: Context): Int {
    val batteryManager = context.getSystemService(Context.BATTERY_SERVICE) as BatteryManager
    val batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    return batteryLevel
}