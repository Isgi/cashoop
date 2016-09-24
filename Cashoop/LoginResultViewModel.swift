//
////  LoginViewModel.swift
////  Cashoop
////
////  Created by Isgi Arriza on 9/20/16.
////  Copyright © 2016 Isgi Arriza. All rights reserved.
//
//
//import Foundation
//import RxSwift
//
//class LoginResultViewModel {
//    private let loginResultModel : LoginResultModel
//    let disposeBag = DisposeBag()
//    
//    var id_pengguna, usernm, email, created_at, updated_at, token, nama_depan, nama_belakang, kelamin, tanggal_lahir, alamat, hp : BehaviorSubject<String>
//    
//    init(loginResultModel : LoginResultModel){
//        self.loginResultModel = loginResultModel
//        
//        id_pengguna = BehaviorSubject(value: String(loginResultModel.id_pengguna))
//        id_pengguna.subscribeNext { (id_pengguna) in
//            var id_peng = String(loginResultModel.id_pengguna)
//            id_peng = id_pengguna
//        }.addDisposableTo(disposeBag)
//        
//        usernm = BehaviorSubject<String>(value: loginResultModel.usernm)
//        usernm.subscribeNext { (usernm) in
//            loginResultModel.usernm = usernm
//            }.addDisposableTo(disposeBag)
//        
//        email = BehaviorSubject<String>(value: loginResultModel.email)
//        email.subscribeNext { (email) in
//            loginResultModel.email = email
//            }.addDisposableTo(disposeBag)
//        
//        created_at = BehaviorSubject<String>(value: loginResultModel.created_at)
//        created_at.subscribeNext { (created_at) in
//            loginResultModel.created_at = created_at
//            }.addDisposableTo(disposeBag)
//        
//        updated_at = BehaviorSubject<String>(value: loginResultModel.updated_at)
//        created_at.subscribeNext { (updated_at) in
//            loginResultModel.updated_at = updated_at
//            }.addDisposableTo(disposeBag)
//        
//        token = BehaviorSubject<String>(value: loginResultModel.token)
//        token.subscribeNext { (token) in
//            loginResultModel.token = token
//            }.addDisposableTo(disposeBag)
//        
//        nama_depan = BehaviorSubject<String>(value: loginResultModel.nama_depan)
//        nama_depan.subscribeNext { (email) in
//            loginResultModel.email = email
//            }.addDisposableTo(disposeBag)
//        
//        nama_belakang = BehaviorSubject<String>(value: loginResultModel.nama_belakang)
//        nama_belakang.subscribeNext { (nama_belakang) in
//            loginResultModel.nama_belakang = nama_belakang
//            }.addDisposableTo(disposeBag)
//        
//        kelamin = BehaviorSubject<String>(value: loginResultModel.kelamin)
//        kelamin.subscribeNext { (kelamin) in
//            loginResultModel.kelamin = kelamin
//            }.addDisposableTo(disposeBag)
//        
//        tanggal_lahir = BehaviorSubject<String>(value: loginResultModel.tanggal_lahir)
//        tanggal_lahir.subscribeNext { (tanggal_lahir) in
//            loginResultModel.tanggal_lahir = tanggal_lahir
//            }.addDisposableTo(disposeBag)
//        
//        alamat = BehaviorSubject<String>(value: loginResultModel.alamat)
//        alamat.subscribeNext { (alamat) in
//            loginResultModel.alamat = alamat
//            }.addDisposableTo(disposeBag)
//        
//        hp = BehaviorSubject<String>(value: loginResultModel.hp)
//        hp.subscribeNext { (hp) in
//            loginResultModel.hp = hp
//            }.addDisposableTo(disposeBag)
//        
//        
//    }
//    
//}
