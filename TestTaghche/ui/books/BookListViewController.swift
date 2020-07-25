
import UIKit
import RxCocoa
import RxSwift
import RxSwiftExt
import RxDataSources

class BookListViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var bookListViewModel: BookListViewModel!
    var disposeBag = DisposeBag()
    var indicator = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func initUIComponent() {
        bookListViewModel = BookListViewModel()
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        initActivityIndicator()
    }
    
    func initActivityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        indicator.style = UIActivityIndicatorView.Style.large
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }
    
    override func bindViewModel() {
        bookListViewModel.bookListResponse.bind(to: self.tableView.rx.items) { tableView, index, book in
            let indexPath = IndexPath(item: index, section: 0)
            guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.bookCell, for: indexPath) else {
                return UITableViewCell()
            }
            cell.setData(book: book)
            return cell
        }.disposed(by: disposeBag)
        bookListViewModel.getBooks()
        
        bookListViewModel.dataError.asObserver().subscribe(onNext: { error in
            print(error)
        }).disposed(by: disposeBag)
        
        bookListViewModel.isLoading.asObserver().subscribe(onNext: { [weak self] isLoading in
            if isLoading {
                self?.indicatorStartAnimating()
            } else {
                self?.indicatorStopAnimating()
            }
        }).disposed(by: disposeBag)
    }
    
    func indicatorStartAnimating() {
        indicator.startAnimating()
    }
    
    func indicatorStopAnimating() {
        indicator.stopAnimating()
    }
}

extension BookListViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
           let height = scrollView.frame.size.height
           let contentYoffset = scrollView.contentOffset.y
           let distanceFromBottom = scrollView.contentSize.height - contentYoffset
           if distanceFromBottom < height {
               bookListViewModel.tableReceivedToLastCell()
           }
       }
}
