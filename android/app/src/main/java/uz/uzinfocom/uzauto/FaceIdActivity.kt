package uz.uzinfocom.uzauto

import android.content.Intent
import android.os.Bundle
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import com.google.gson.Gson
import uz.myid.android.sdk.capture.*
import uz.myid.android.sdk.capture.model.OrganizationDetails
import java.util.*

class FaceIdActivity : AppCompatActivity(), MyIdResultListener {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_face_id)

        startMyId()
    }

    private val TAG = "myIDLOG";

    override fun onError(e: MyIdException) {
        Log.e(TAG, e.toString())
        Log.e(TAG, "error")

        val gson = Gson()
        val resultIntent = Intent()
        resultIntent.putExtra("code", gson.toJson(e.code))

        setResult(RESULT_CANCELED, resultIntent)
        finish()
    }

    override fun onSuccess(result: MyIdResult) {
        Log.w(TAG, result.toString())
        Log.e(TAG, "succes")

        val gson = Gson()
        val resultIntent = Intent()
        resultIntent.putExtra("code", gson.toJson(result.code))

        setResult(RESULT_CANCELED, resultIntent)
        finish()
    }

    override fun onUserExited() {
        Log.w(TAG, "Exit")
    }

    private val client: MyIdClient = MyIdClient()
    private fun startMyId() {

        val myIdConfig = MyIdConfig.builder("uzauto_sdk-TE4QuSI0VYe8ESM2GOswGgdL5tXDbfV2zvPdXYLV")
            .withBuildMode(MyIdBuildMode.DEBUG)
            .withLocale(Locale("en"))
            .withCameraShape(MyIdCameraShape.CIRCLE)
            .withPhoto(true)
            .build()

        val intent = client.createIntent(this, myIdConfig)
        result.launch(intent)
    }

    private val result = takeUserResult(this)
}
