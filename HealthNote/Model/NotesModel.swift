//
//  NotesModel.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 29/05/24.
//

import Foundation

struct Notes: Identifiable, Hashable {
    var id: Int
    var title: String
    var createdAt: String
    var summary: String
    var rawVoice: String
}

let notesDummyData: [Notes] = [
    Notes(id: 1, title: "Kontrol Pertama", createdAt: getCurrentDate(), summary: "The doctor informed the patient that their blood pressure reading of 145/95 mmHg is high and discussed related symptoms like tiredness, headaches, dizziness, and blurred vision. The doctor explained that hypertension can lead to serious health problems such as heart disease and stroke. They recommended lifestyle changes, including a healthier diet, regular exercise, reduced salt intake, and stress management. The doctor suggested monitoring blood pressure at home and reducing alcohol intake while avoiding smoking.", rawVoice: "I see. Let's start by checking your blood pressure. Your reading today is 145/95 mmHg, which is higher than normal. Have you been experiencing any other symptoms? Sometimes I feel dizzy, and my vision gets blurry occasionally. These can be signs of high blood pressure. Have you noticed any changes in your lifestyle or stress levels recently? I’ve been under a lot of stress at work, and I haven't had much time to exercise. My diet hasn’t been great either – a lot of takeout food. Stress and poor diet can certainly contribute to high blood pressure. Let’s talk about hypertension and what we can do to manage it. Hypertension, or high blood pressure, is when the force of the blood against your artery walls is consistently too high. Over time, it can cause serious health issues like heart disease, stroke, and kidney problems."),
    Notes(id: 2, title: "Kontrol Kedua", createdAt: getCurrentDate(), summary: "The doctor informed the patient that their blood pressure reading of 145/95 mmHg is high and discussed related symptoms like tiredness, headaches, dizziness, and blurred vision. The doctor explained that hypertension can lead to serious health problems such as heart disease and stroke. They recommended lifestyle changes, including a healthier diet, regular exercise, reduced salt intake, and stress management. The doctor suggested monitoring blood pressure at home and reducing alcohol intake while avoiding smoking.", rawVoice: "I see. Let's start by checking your blood pressure. Your reading today is 145/95 mmHg, which is higher than normal. Have you been experiencing any other symptoms? Sometimes I feel dizzy, and my vision gets blurry occasionally. These can be signs of high blood pressure. Have you noticed any changes in your lifestyle or stress levels recently? I’ve been under a lot of stress at work, and I haven't had much time to exercise. My diet hasn’t been great either – a lot of takeout food. Stress and poor diet can certainly contribute to high blood pressure. Let’s talk about hypertension and what we can do to manage it. Hypertension, or high blood pressure, is when the force of the blood against your artery walls is consistently too high. Over time, it can cause serious health issues like heart disease, stroke, and kidney problems."),
    Notes(id: 1, title: "Kontrol Pertama", createdAt: getCurrentDate(), summary: "The doctor informed the patient that their blood pressure reading of 145/95 mmHg is high and discussed related symptoms like tiredness, headaches, dizziness, and blurred vision. The doctor explained that hypertension can lead to serious health problems such as heart disease and stroke. They recommended lifestyle changes, including a healthier diet, regular exercise, reduced salt intake, and stress management. The doctor suggested monitoring blood pressure at home and reducing alcohol intake while avoiding smoking.", rawVoice: "I see. Let's start by checking your blood pressure. Your reading today is 145/95 mmHg, which is higher than normal. Have you been experiencing any other symptoms? Sometimes I feel dizzy, and my vision gets blurry occasionally. These can be signs of high blood pressure. Have you noticed any changes in your lifestyle or stress levels recently? I’ve been under a lot of stress at work, and I haven't had much time to exercise. My diet hasn’t been great either – a lot of takeout food. Stress and poor diet can certainly contribute to high blood pressure. Let’s talk about hypertension and what we can do to manage it. Hypertension, or high blood pressure, is when the force of the blood against your artery walls is consistently too high. Over time, it can cause serious health issues like heart disease, stroke, and kidney problems."),
    Notes(id: 2, title: "Kontrol Kedua", createdAt: getCurrentDate(), summary: "The doctor informed the patient that their blood pressure reading of 145/95 mmHg is high and discussed related symptoms like tiredness, headaches, dizziness, and blurred vision. The doctor explained that hypertension can lead to serious health problems such as heart disease and stroke. They recommended lifestyle changes, including a healthier diet, regular exercise, reduced salt intake, and stress management. The doctor suggested monitoring blood pressure at home and reducing alcohol intake while avoiding smoking.", rawVoice: "I see. Let's start by checking your blood pressure. Your reading today is 145/95 mmHg, which is higher than normal. Have you been experiencing any other symptoms? Sometimes I feel dizzy, and my vision gets blurry occasionally. These can be signs of high blood pressure. Have you noticed any changes in your lifestyle or stress levels recently? I’ve been under a lot of stress at work, and I haven't had much time to exercise. My diet hasn’t been great either – a lot of takeout food. Stress and poor diet can certainly contribute to high blood pressure. Let’s talk about hypertension and what we can do to manage it. Hypertension, or high blood pressure, is when the force of the blood against your artery walls is consistently too high. Over time, it can cause serious health issues like heart disease, stroke, and kidney problems."),
    Notes(id: 1, title: "Kontrol Pertama", createdAt: getCurrentDate(), summary: "The doctor informed the patient that their blood pressure reading of 145/95 mmHg is high and discussed related symptoms like tiredness, headaches, dizziness, and blurred vision. The doctor explained that hypertension can lead to serious health problems such as heart disease and stroke. They recommended lifestyle changes, including a healthier diet, regular exercise, reduced salt intake, and stress management. The doctor suggested monitoring blood pressure at home and reducing alcohol intake while avoiding smoking.", rawVoice: "I see. Let's start by checking your blood pressure. Your reading today is 145/95 mmHg, which is higher than normal. Have you been experiencing any other symptoms? Sometimes I feel dizzy, and my vision gets blurry occasionally. These can be signs of high blood pressure. Have you noticed any changes in your lifestyle or stress levels recently? I’ve been under a lot of stress at work, and I haven't had much time to exercise. My diet hasn’t been great either – a lot of takeout food. Stress and poor diet can certainly contribute to high blood pressure. Let’s talk about hypertension and what we can do to manage it. Hypertension, or high blood pressure, is when the force of the blood against your artery walls is consistently too high. Over time, it can cause serious health issues like heart disease, stroke, and kidney problems."),
    Notes(id: 2, title: "Kontrol Kedua", createdAt: getCurrentDate(), summary: "The doctor informed the patient that their blood pressure reading of 145/95 mmHg is high and discussed related symptoms like tiredness, headaches, dizziness, and blurred vision. The doctor explained that hypertension can lead to serious health problems such as heart disease and stroke. They recommended lifestyle changes, including a healthier diet, regular exercise, reduced salt intake, and stress management. The doctor suggested monitoring blood pressure at home and reducing alcohol intake while avoiding smoking.", rawVoice: "I see. Let's start by checking your blood pressure. Your reading today is 145/95 mmHg, which is higher than normal. Have you been experiencing any other symptoms? Sometimes I feel dizzy, and my vision gets blurry occasionally. These can be signs of high blood pressure. Have you noticed any changes in your lifestyle or stress levels recently? I’ve been under a lot of stress at work, and I haven't had much time to exercise. My diet hasn’t been great either – a lot of takeout food. Stress and poor diet can certainly contribute to high blood pressure. Let’s talk about hypertension and what we can do to manage it. Hypertension, or high blood pressure, is when the force of the blood against your artery walls is consistently too high. Over time, it can cause serious health issues like heart disease, stroke, and kidney problems."),
    Notes(id: 1, title: "Kontrol Pertama", createdAt: getCurrentDate(), summary: "The doctor informed the patient that their blood pressure reading of 145/95 mmHg is high and discussed related symptoms like tiredness, headaches, dizziness, and blurred vision. The doctor explained that hypertension can lead to serious health problems such as heart disease and stroke. They recommended lifestyle changes, including a healthier diet, regular exercise, reduced salt intake, and stress management. The doctor suggested monitoring blood pressure at home and reducing alcohol intake while avoiding smoking.", rawVoice: "I see. Let's start by checking your blood pressure. Your reading today is 145/95 mmHg, which is higher than normal. Have you been experiencing any other symptoms? Sometimes I feel dizzy, and my vision gets blurry occasionally. These can be signs of high blood pressure. Have you noticed any changes in your lifestyle or stress levels recently? I’ve been under a lot of stress at work, and I haven't had much time to exercise. My diet hasn’t been great either – a lot of takeout food. Stress and poor diet can certainly contribute to high blood pressure. Let’s talk about hypertension and what we can do to manage it. Hypertension, or high blood pressure, is when the force of the blood against your artery walls is consistently too high. Over time, it can cause serious health issues like heart disease, stroke, and kidney problems."),
    Notes(id: 2, title: "Kontrol Kedua", createdAt: getCurrentDate(), summary: "The doctor informed the patient that their blood pressure reading of 145/95 mmHg is high and discussed related symptoms like tiredness, headaches, dizziness, and blurred vision. The doctor explained that hypertension can lead to serious health problems such as heart disease and stroke. They recommended lifestyle changes, including a healthier diet, regular exercise, reduced salt intake, and stress management. The doctor suggested monitoring blood pressure at home and reducing alcohol intake while avoiding smoking.", rawVoice: "I see. Let's start by checking your blood pressure. Your reading today is 145/95 mmHg, which is higher than normal. Have you been experiencing any other symptoms? Sometimes I feel dizzy, and my vision gets blurry occasionally. These can be signs of high blood pressure. Have you noticed any changes in your lifestyle or stress levels recently? I’ve been under a lot of stress at work, and I haven't had much time to exercise. My diet hasn’t been great either – a lot of takeout food. Stress and poor diet can certainly contribute to high blood pressure. Let’s talk about hypertension and what we can do to manage it. Hypertension, or high blood pressure, is when the force of the blood against your artery walls is consistently too high. Over time, it can cause serious health issues like heart disease, stroke, and kidney problems."),
    Notes(id: 1, title: "Kontrol Pertama", createdAt: getCurrentDate(), summary: "The doctor informed the patient that their blood pressure reading of 145/95 mmHg is high and discussed related symptoms like tiredness, headaches, dizziness, and blurred vision. The doctor explained that hypertension can lead to serious health problems such as heart disease and stroke. They recommended lifestyle changes, including a healthier diet, regular exercise, reduced salt intake, and stress management. The doctor suggested monitoring blood pressure at home and reducing alcohol intake while avoiding smoking.", rawVoice: "I see. Let's start by checking your blood pressure. Your reading today is 145/95 mmHg, which is higher than normal. Have you been experiencing any other symptoms? Sometimes I feel dizzy, and my vision gets blurry occasionally. These can be signs of high blood pressure. Have you noticed any changes in your lifestyle or stress levels recently? I’ve been under a lot of stress at work, and I haven't had much time to exercise. My diet hasn’t been great either – a lot of takeout food. Stress and poor diet can certainly contribute to high blood pressure. Let’s talk about hypertension and what we can do to manage it. Hypertension, or high blood pressure, is when the force of the blood against your artery walls is consistently too high. Over time, it can cause serious health issues like heart disease, stroke, and kidney problems."),
    Notes(id: 2, title: "Kontrol Kedua", createdAt: getCurrentDate(), summary: "The doctor informed the patient that their blood pressure reading of 145/95 mmHg is high and discussed related symptoms like tiredness, headaches, dizziness, and blurred vision. The doctor explained that hypertension can lead to serious health problems such as heart disease and stroke. They recommended lifestyle changes, including a healthier diet, regular exercise, reduced salt intake, and stress management. The doctor suggested monitoring blood pressure at home and reducing alcohol intake while avoiding smoking.", rawVoice: "I see. Let's start by checking your blood pressure. Your reading today is 145/95 mmHg, which is higher than normal. Have you been experiencing any other symptoms? Sometimes I feel dizzy, and my vision gets blurry occasionally. These can be signs of high blood pressure. Have you noticed any changes in your lifestyle or stress levels recently? I’ve been under a lot of stress at work, and I haven't had much time to exercise. My diet hasn’t been great either – a lot of takeout food. Stress and poor diet can certainly contribute to high blood pressure. Let’s talk about hypertension and what we can do to manage it. Hypertension, or high blood pressure, is when the force of the blood against your artery walls is consistently too high. Over time, it can cause serious health issues like heart disease, stroke, and kidney problems."),
    Notes(id: 1, title: "Kontrol Pertama", createdAt: getCurrentDate(), summary: "The doctor informed the patient that their blood pressure reading of 145/95 mmHg is high and discussed related symptoms like tiredness, headaches, dizziness, and blurred vision. The doctor explained that hypertension can lead to serious health problems such as heart disease and stroke. They recommended lifestyle changes, including a healthier diet, regular exercise, reduced salt intake, and stress management. The doctor suggested monitoring blood pressure at home and reducing alcohol intake while avoiding smoking.", rawVoice: "I see. Let's start by checking your blood pressure. Your reading today is 145/95 mmHg, which is higher than normal. Have you been experiencing any other symptoms? Sometimes I feel dizzy, and my vision gets blurry occasionally. These can be signs of high blood pressure. Have you noticed any changes in your lifestyle or stress levels recently? I’ve been under a lot of stress at work, and I haven't had much time to exercise. My diet hasn’t been great either – a lot of takeout food. Stress and poor diet can certainly contribute to high blood pressure. Let’s talk about hypertension and what we can do to manage it. Hypertension, or high blood pressure, is when the force of the blood against your artery walls is consistently too high. Over time, it can cause serious health issues like heart disease, stroke, and kidney problems."),
    Notes(id: 2, title: "Kontrol Kedua", createdAt: getCurrentDate(), summary: "The doctor informed the patient that their blood pressure reading of 145/95 mmHg is high and discussed related symptoms like tiredness, headaches, dizziness, and blurred vision. The doctor explained that hypertension can lead to serious health problems such as heart disease and stroke. They recommended lifestyle changes, including a healthier diet, regular exercise, reduced salt intake, and stress management. The doctor suggested monitoring blood pressure at home and reducing alcohol intake while avoiding smoking.", rawVoice: "I see. Let's start by checking your blood pressure. Your reading today is 145/95 mmHg, which is higher than normal. Have you been experiencing any other symptoms? Sometimes I feel dizzy, and my vision gets blurry occasionally. These can be signs of high blood pressure. Have you noticed any changes in your lifestyle or stress levels recently? I’ve been under a lot of stress at work, and I haven't had much time to exercise. My diet hasn’t been great either – a lot of takeout food. Stress and poor diet can certainly contribute to high blood pressure. Let’s talk about hypertension and what we can do to manage it. Hypertension, or high blood pressure, is when the force of the blood against your artery walls is consistently too high. Over time, it can cause serious health issues like heart disease, stroke, and kidney problems.")
]