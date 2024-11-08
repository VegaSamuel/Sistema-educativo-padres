package com.example.sistema_educativo_padres.ui.login

import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.example.sistema_educativo_padres.MainActivity
import com.example.sistema_educativo_padres.R
import com.google.android.gms.auth.api.signin.GoogleSignIn
import com.google.android.gms.auth.api.signin.GoogleSignInAccount
import com.google.android.gms.auth.api.signin.GoogleSignInClient
import com.google.android.gms.auth.api.signin.GoogleSignInOptions
import com.google.android.gms.common.api.ApiException
import com.google.firebase.FirebaseApp
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.auth.GoogleAuthProvider

@Suppress("DEPRECATION")
class LoginActivity : AppCompatActivity() {
    private lateinit var googleSignInClient: GoogleSignInClient
    private lateinit var firebaseAuth: FirebaseAuth

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.login_activity)
        FirebaseApp.initializeApp(this)

        firebaseAuth = FirebaseAuth.getInstance()

        val gso = GoogleSignInOptions.Builder(GoogleSignInOptions.DEFAULT_SIGN_IN)
            .requestIdToken(getString(R.string.api_key))
            .requestEmail()
            .build()

        googleSignInClient = GoogleSignIn.getClient(this, gso)

        findViewById<Button>(R.id.loginButtonGoogle).setOnClickListener {
            signInWithGoogle()
        }

        findViewById<Button>(R.id.loginButton).setOnClickListener {
            signInWithEmail()
        }
    }

    private fun signInWithGoogle() {
        val signInIntent = googleSignInClient.signInIntent
        startActivityForResult(signInIntent, RC_SIGN_IN)
    }

    private fun signInWithEmail() {
        val emailField = findViewById<EditText>(R.id.emailText)
        val passwordField = findViewById<EditText>(R.id.passwordText)

        val email = emailField.text.toString()
        val password = passwordField.text.toString()

        if(email.isNotEmpty() && password.isNotEmpty()) {
            firebaseAuth.signInWithEmailAndPassword(email, password).addOnCompleteListener(this) { task ->
                if (task.isSuccessful) {
                    Toast.makeText(this, "Inicio de sesión con correo exitoso", Toast.LENGTH_SHORT).show()
                    val main = Intent(this, MainActivity::class.java)
                    startActivity(main)
                    finish()
                } else {
                    Toast.makeText(this, "Error de inicio de sesión con correo", Toast.LENGTH_SHORT).show()
                }
            }
        }else {
            Toast.makeText(this, "Por favor, ingrese correo y contraseña", Toast.LENGTH_SHORT).show()
        }
    }

    override fun onStart() {
        super.onStart()

        val usuarioActual = FirebaseAuth.getInstance().currentUser
        if(usuarioActual != null) {
            val user = FirebaseAuth.getInstance().currentUser

            val main = Intent(this, MainActivity::class.java).apply {
                putExtra("userName", user?.displayName)
                putExtra("userEmail", user?.email)
                putExtra("userPhotoUrl", user?.photoUrl.toString())
            }
            startActivity(main)
            finish()
            return
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if (requestCode == RC_SIGN_IN) {
            val task = GoogleSignIn.getSignedInAccountFromIntent(data)
            try {
                val cuenta = task.getResult(ApiException::class.java)
                firebaseAuthWithGoogle(cuenta)
            } catch (e: ApiException) {
                Toast.makeText(this, "Error en Google Sign-In", Toast.LENGTH_SHORT).show()
            }
        }
    }

    @Suppress("DEPRECATION")
    private fun firebaseAuthWithGoogle(cuenta: GoogleSignInAccount?) {
        val crediencial = GoogleAuthProvider.getCredential(cuenta?.idToken, null)
        firebaseAuth.signInWithCredential(crediencial).addOnCompleteListener(this) { task ->
                if (task.isSuccessful) {
                    Toast.makeText(this, "Inicio de sesión con Google exitoso", Toast.LENGTH_SHORT).show()

                    val user = firebaseAuth.currentUser

                    val main = Intent(this, MainActivity::class.java).apply {
                        putExtra("userName", user?.displayName)
                        putExtra("userEmail", user?.email)
                        putExtra("userPhotoUrl", user?.photoUrl.toString())
                    }
                    startActivity(main)
                    finish()
                }else {
                    Toast.makeText(this, "Fallo en la autenticación", Toast.LENGTH_SHORT).show()
                }
            }
    }

    companion object {
        private const val RC_SIGN_IN = 9001
    }
}