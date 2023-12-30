//
//  SwiftDataExample.swift
//  SwiftUISamples
//
//  Created by Mark Wells on 12/27/23.
//

import SwiftUI
import SwiftData

struct SwiftDataExample: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var employees: [Person]
    @Query var departments: [Department]
    @Query(filter: #Predicate<Department> { $0.name == "Unassigned" }) var unassignedDept: [Department]
    @State var path = [Person]()
    @State var isShowingDepartments = false
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                List {
                    ForEach(employees) { employee in
                        NavigationLink(value: employee) {
                            Text(employee.name)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        deleteEmployees(at: indexSet)
                    })
                }
                .navigationDestination(for: Person.self, destination: SwiftDataEditForm.init)
                
                Button("Departments") {
                    isShowingDepartments.toggle()
                }
            }
            .toolbar(content: {
                ToolbarItem {
                    Button(action: addEmployee, label: {
                        Image(systemName: "plus")
                    })
                }
            })
            .sheet(isPresented: $isShowingDepartments, content: {
                DepartmentView()
            })
            .navigationTitle("Employees")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear() {
                if departments.isEmpty {
                    let unassigned = Department(name: "Unassigned")
                    let manufacturing = Department(name: "Manufacturing")
                    let accounting = Department(name: "Accounting")
                    let hr = Department(name: "Human Resources")
                    modelContext.insert(unassigned)
                    modelContext.insert(manufacturing)
                    modelContext.insert(accounting)
                    modelContext.insert(hr)
                }
            }
        }
    }
    
    func addEmployee() {
        guard let unassigned = unassignedDept.first else { return }
        let newEmployee = Person()
        newEmployee.department = unassigned
        modelContext.insert(newEmployee)
        path = [newEmployee]
    }
    
    func deleteEmployees(at indexes: IndexSet) {
        for index in indexes {
            let employeeToDelete = employees[index]
            modelContext.delete(employeeToDelete)
        }
    }
}

struct SwiftDataEditForm: View {
    
    @Bindable var employee: Person
    @Query var departments: [Department]
    
    init(employee: Person) {
        self.employee = employee
    }
    
    var body: some View {
        VStack {
            Form {
                TextField("Name", text: $employee.name)
                TextField("Postal code", text: $employee.postalCode)
                Picker("Department", selection: $employee.department) {
                    ForEach(departments) { department in
                        Text(department.name)
                            .tag(Optional(department))
                    }
                }
            }
        }
        .navigationTitle("Edit Employee")
    }
}

struct DepartmentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var departments: [Department]
    
    var body: some View {
        List {
            Section("Departments") {
                ForEach(departments) { dept in
                    HStack {
                        Text(dept.name)
                        Spacer()
                        Text(String(dept.employees.count))
                            .font(.headline)
                            .padding([.leading, .trailing], 10)
                            .padding([.top, .bottom], 5)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(Capsule())
                    }
                }
            }
        }
    }
}

@Model
class Person {
    var name: String
    var postalCode: String
    var department: Department?
    
    init(name: String = "", postalCode: String = "") {
        self.name = name
        self.postalCode = postalCode
    }
}

@Model
class Department {
    var name: String
    var employees: [Person]
    
    init(name: String = "") { //, employees: [Person] = []) {
        self.name = name
        self.employees = []
    }
}
