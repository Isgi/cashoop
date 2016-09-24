//
//  LoginModel.swift
//  Cashoop
//
//  Created by Isgi Arriza on 9/20/16.
//  Copyright © 2016 Isgi Arriza. All rights reserved.
//

import Foundation
import MapKit

class LoginResultModel {
    var id_pengguna : Int
    var usernm, email, created_at, updated_at, token, nama_depan, nama_belakang, kelamin, tanggal_lahir, alamat, hp : String
    
    
    
    init(id_pengguna : Int, usernm : String, email : String, created_at : String, updated_at : String, token : String, nama_depan : String, nama_belakang : String, kelamin : String, tanggal_lahir : String, alamat : String, hp : String){
        self.id_pengguna = id_pengguna
        self.usernm = usernm
        self.email = email
        self.created_at = created_at
        self.updated_at = updated_at
        self.token = token
        self.nama_depan = nama_depan
        self.nama_belakang = nama_belakang
        self.kelamin = kelamin
        self.tanggal_lahir = tanggal_lahir
        self.alamat = alamat
        self.hp = hp
    }
}


