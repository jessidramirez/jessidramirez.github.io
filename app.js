const express = require('express');
const session = require('express-session');
const app = express();
app.use(express.urlencoded({extended:false}));
app.use(express.json());

app.use('/Recursos', express.static('public'));
app.use('/Recursos', express.static(__dirname+'/public'));

app.set('view engine','ejs');

const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password:'',
    database:'EmpresaDB'
});

connection.connect((error)=>{
    if(error){
        console.log('El error de conexión es: '+error)
    }
    console.log('Conectado a la base de datos')
});

module.exports = connection;

app.use(session({
    secret:'9512357',
    resave:true,
    saveUninitialized:true
}))
//Funciones
app.post('/ingreso', async(req,res)=>{
    const Usuario=req.body.user;
    const Contraseña=req.body.pass;

    connection.query('SELECT * FROM usuarios WHERE correo=?',[Usuario], async(error,results)=>{
        if (results.length==0 || !((Contraseña==results[0].contraseña))) {
            res.render('LOGIN',{
                login: true,
                usuario:req.session.name,
                id_usuario:req.session.id_usuario,
                mensaje:"Usuario o contraseña incorrectos"
           })
        } else {
            req.session.loggedin = true;
            req.session.name = results[0].nombre;
            req.session.id_usuario = results[0].id;
            req.session.rol = results[0].rol;
            res.render('HOME',{
                login: true,
                usuario:req.session.name,
                id_usuario:req.session.id_usuario,
                rol:req.session.rol,
                mensaje:"Ingreso exitoso"
           })
        }
    })
})
//Cerrar session
app.get('/logout',(req,res)=>{
    req.session.destroy(()=>{
        res.redirect('/')
    })
})


//vistas
app.get('/',(req,res)=>{
    if (req.session.loggedin) {
        res.render('HOME',{
            login: true,
            name:req.session.name,
            id_usuario:req.session.id_usuario
        });
    } else {
        res.render('HOME',{
            login: false,
            name:'Debe iniciar sesión',
            id_usuario:0
        });
    }
    
})
app.get('/CONTRATOS',(req,res)=>{
    connection.query('SELECT o.id AS Orden,c.direccion AS Direccion,o.servicio AS Servicio,u.nombre AS Tecnico,o.fecha AS Fecha FROM ordenes o JOIN clientes c ON o.id_cliente = c.id JOIN usuarios u ON o.id_tecnico = u.id;', async(error,results)=>{
        if (error) {
            console.log(error.message);
        } else {
            if (req.session.loggedin) {
                res.render('CONTRATOS',{
                    login: true,
                    usuario:req.session.name,
                    rol:req.session.rol,
                    id_usuario:req.session.id_usuario,
                    ordenes:results
                });
            } else {
                res.render('CONTRATOS',{
                    login: false,
                    usuario:'Debe iniciar sesión',
                    rol:'',
                    id_usuario:0,
                    ordenes:results
                });
            }
        }
    })
})
app.get('/SERVICIOS',(req,res)=>{
    if (req.session.loggedin) {
        res.render('SERVICIOS',{
            login: true,
            usuario:req.session.name,
            rol:req.session.rol,
            id_usuario:req.session.id_usuario
        });
    } else {
        res.render('SERVICIOS',{
            login: false,
            usuario:'Debe iniciar sesión',
            id_usuario:0
        });
    }
})
app.get('/CONTACTO',(req,res)=>{
    if (req.session.loggedin) {
        res.render('CONTACTO',{
            login: true,
            usuario:req.session.name,
            rol:req.session.rol,
            id_usuario:req.session.id_usuario
        });
    } else {
        res.render('CONTACTO',{
            login: false,
            usuario:'Debe iniciar sesión',
            rol:'',
            id_usuario:0
        });
    }
})
app.get('/CREARCLIENTE',(req,res)=>{
    if (req.session.loggedin) {
        res.render('CREARCLIENTE',{
            login: true,
            usuario:req.session.name,
            rol:req.session.rol,
            id_usuario:req.session.id_usuario
        });
    } else {
        res.render('CREARCLIENTE',{
            login: false,
            usuario:'Debe iniciar sesión',
            rol:'',
            id_usuario:0
        });
    }
})
app.get('/SINGIN',(req,res)=>{
    if (req.session.loggedin) {
        res.render('SINGIN',{
            login: true,
            usuario:req.session.name,
            id_usuario:req.session.id_usuario
        });
    } else {
        res.render('SINGIN',{
            login: false,
            usuario:'Debe iniciar sesión',
            id_usuario:0
        });
    }
})
app.get('/LOGIN',(req,res)=>{
    if (req.session.loggedin) {
        res.render('LOGIN',{
            login: true,
            usuario:req.session.name,
            id_usuario:req.session.id_usuario
        });
    } else {
        res.render('LOGIN',{
            login: false,
            usuario:'Debe iniciar sesión',
            id_usuario:0
        });
    }
})
app.get('/GESTION',(req,res)=>{
    connection.query('SELECT * FROM clientes', async(error,results)=>{
        if (error) {
            console.log(error.message);
        } else {
            if (req.session.loggedin) {
                res.render('GESTION',{
                    login: true,
                    usuario:req.session.name,
                    rol:req.session.rol,
                    id_usuario:req.session.id_usuario,
                    clientes:results
                });
            } else {
                res.render('GESTION',{
                    login: false,
                    usuario:'Debe iniciar sesión',
                    rol:'',
                    id_usuario:0,
                    clientes:results
                });
            }
        }
    })
})
app.listen(3000,(req,res)=>{
    console.log('Servidor en linea: http://localhost:3000');
})