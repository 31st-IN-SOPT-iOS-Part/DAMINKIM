//
//  ProfileImageModel.swift
//  Assignment2
//
//  Created by 김담인 on 2022/10/14.
//

import Foundation

struct ProfileModel {
    let profileImageTitle: String
    let profileName: String
    let profileStatusMessage: String
}

extension ProfileModel {
    static var friendList: [ProfileModel] = [
        ProfileModel(profileImageTitle: "profileImage1", profileName: "솝트1", profileStatusMessage: "아 피곤해"),
        ProfileModel(profileImageTitle: "profileImage2", profileName: "솝트2", profileStatusMessage: "아 피곤해"),
        ProfileModel(profileImageTitle: "profileImage3", profileName: "솝트3", profileStatusMessage: "아 피곤해"),
        ProfileModel(profileImageTitle: "profileImage4", profileName: "솝트4", profileStatusMessage: "아 피곤해"),
        ProfileModel(profileImageTitle: "profileImage5", profileName: "솝트5", profileStatusMessage: "아 피곤해"),
        ProfileModel(profileImageTitle: "profileImage6", profileName: "솝트6", profileStatusMessage: "아 피곤해"),
        ProfileModel(profileImageTitle: "profileImage7", profileName: "솝트7", profileStatusMessage: "아 피곤해"),
        ProfileModel(profileImageTitle: "profileImage8", profileName: "솝트8", profileStatusMessage: "아 피곤해"),
        ProfileModel(profileImageTitle: "profileImage9", profileName: "솝트9", profileStatusMessage: "아 피곤해"),
        ProfileModel(profileImageTitle: "profileImage10", profileName: "솝트10", profileStatusMessage: "아 피곤해"),
        ProfileModel(profileImageTitle: "profileImage1", profileName: "솝트11", profileStatusMessage: "아 피곤해"),
        ProfileModel(profileImageTitle: "profileImage2", profileName: "솝트12", profileStatusMessage: "아 피곤해"),
        ProfileModel(profileImageTitle: "profileImage3", profileName: "솝트13", profileStatusMessage: "아 피곤해"),
        ProfileModel(profileImageTitle: "profileImage4", profileName: "솝트14", profileStatusMessage: "아 피곤해"),
        ProfileModel(profileImageTitle: "profileImage5", profileName: "솝트15", profileStatusMessage: "아 피곤해"),
        ProfileModel(profileImageTitle: "profileImage6", profileName: "솝트16", profileStatusMessage: "아 피곤해"),
        ProfileModel(profileImageTitle: "profileImage7", profileName: "솝트17", profileStatusMessage: "아 피곤해"),
        ProfileModel(profileImageTitle: "profileImage8", profileName: "솝트18", profileStatusMessage: "아 피곤해"),
        ProfileModel(profileImageTitle: "profileImage9", profileName: "솝트19", profileStatusMessage: "아 피곤해"),
        ProfileModel(profileImageTitle: "profileImage10", profileName: "솝트20", profileStatusMessage: "아 피곤해")
    ]
}
