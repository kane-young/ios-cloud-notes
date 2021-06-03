//
//  TableViewModel.swift
//  CloudNotes
//
//  Created by 이영우 on 2021/06/02.
//

import Foundation

class MemoListViewModel {
  private var memoServiceAdapter = MemoProvider()
  private lazy var memos: [Memo]? = {
    do {
      try memoServiceAdapter.setMockData()
      return self.memoServiceAdapter.getMemo()
    } catch {
      return nil
    }
  }()
  
  func addMemo(_ memo: Memo) {
    memos?.append(memo)
  }
  
  func getNumberOfMemo() -> Int {
    guard let memos = memos else {
      return .zero
    }
    return memos.count
  }
  
  func getMemoViewModel(for indexPath: IndexPath) -> MemoViewModel? {
    guard let memos = memos else {
      return nil
    }
    let memo = memos[indexPath.row]
    return MemoViewModel(title: memo.title, date: memo.lastModifiedDate, content: memo.body)
  }
  
  func getMemo(for indexPath: IndexPath) -> Memo? {
    guard let memos = memos else {
      return nil
    }
    
    return memos[indexPath.row]
  }
}
